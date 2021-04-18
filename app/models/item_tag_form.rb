class ItemTagForm
  
  include ActiveModel::Model
  attr_accessor :item_name, :item_text, :category_id, :item_state_id,
                :paying_for_shipping_id, :shipping_area_id, :shipping_day_id, 
                :price, :user_id, :tag_name, :images

  # tagモデルのバリデーション
  validates :tag_name, presence: true

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

  def save
    item = Item.create(item_name: item_name, item_text: item_text, category_id: category_id,
                       item_state_id: item_state_id, paying_for_shipping_id: paying_for_shipping_id,
                       shipping_area_id: shipping_area_id,shipping_day_id: shipping_day_id,price: price,
                       user_id: user_id,tag_name: tag_name,images: images)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTag.create(item_id: item.id, tag_id: tag.id)
  end
end