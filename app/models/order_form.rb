class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :region_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'Input only number' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, street_address: street_address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
