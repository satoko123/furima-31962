class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order
  has_many :tags, through: :item_tags
  has_many :item_tags

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :paying_for_shipping
  belongs_to :shipping_area
  belongs_to :shipping_day
end
