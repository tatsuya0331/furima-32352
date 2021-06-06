class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit]
    before_action :set_item, only: [:edit, :show]

    def index
        @items = Item.order("created_at DESC")
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
    end

    def edit
        unless current_user.id == @item.user.id
            redirect_to root_path
        end
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to item_path
        else
            render :edit
        end
    end

    private
    def item_params
        params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :delivery_id, :days_delivery_id, :price).merge(user_id: current_user.id)
    end

    def set_item
        @item = Item.find(params[:id]) 
    end
end
