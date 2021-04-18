class Tag < ApplicationRecord
  has_many :items, through: :item_tags
  has_many :item_tags

  validates :tag_name, uniqueness: true #一意性は各モデルに記載する
end
