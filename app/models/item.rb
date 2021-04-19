class Item < ApplicationRecord
  validates :images, presence: true
  with_options presence: true do
    validates :item_name
    validates :item_text
  end
  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :item_state_id
    validates :paying_for_shipping_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
  validates :price, presence: true, inclusion: { in: 300..9_999_999, message: 'は指定された範囲(¥300~¥9,999,999)で設定してください' },
                    format: { with: /\A\d+\z/, message: 'は半角数字で入力してください' }
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
