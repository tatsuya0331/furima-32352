class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    # has_one :purchase
    belongs_to :user
    belongs_to :category
    belongs_to :status
    belongs_to :delivery
    belongs_to :days_delivery
    belongs_to :burden
    has_one_attached :image

    with_options presence: true do
        validates :image
        validates :product_name, length: { maximum: 40}
        validates :description, length: { maximum: 1000}
        validates :price, format: { with: /\A[0-9]+\z/}
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

    with_options numericality:  {other_than: 1} do
        validates :category_id
        validates :status_id
        validates :burden_id
        validates :delivery_id
        validates :days_delivery_id
    end
end
