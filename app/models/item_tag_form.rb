class TweetTagForm
  
  include ActiveModel::Model
  attr_accessor :images, :item_name, :item_text, :category_id, :item_state_id,
                :paying_for_shipping_id, :shipping_area_id, :shipping_day_id, 
                :price, :user_id, :tag_name

  # tagモデルのバリデーション
  with options presence: true do
    validates :tag_name
  end

  # itemモデルのバリデーション
  validates :images, presence: true
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

end