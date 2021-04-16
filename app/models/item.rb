class Item < ApplicationRecord
  validates :image, presence: true
  with_options presence: true do
    validates :item_name
    validates :item_text
  end
  with_options presence: true, numericality: { other_than: 1, message: 'select' } do
    validates :category_id
    validates :item_state_id
    validates :paying_for_shipping_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: 'Out of setting range' },
                    format: { with: /\A\d+\z/, message: 'Half-width number' }
  belongs_to :user
  has_many_attached :images
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :paying_for_shipping
  belongs_to :shipping_area
  belongs_to :shipping_day
end
