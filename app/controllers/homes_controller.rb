class HomesController < ApplicationController
    # before_action :move_to_index, expect: [:index, :show]

    def index
        # query = "SELECT * EROM homes"
        # @home = Home.find_by_sql(query)
    end
end


# private
# def move_to_index
#     redirect_to action: :index unless user_signed_in?
# end