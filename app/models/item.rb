class Item < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :orders, through: :order_items

  def merchant_name
    User.where(id: self.user_id).first.name
  end

  def avg_fulfill_time
    
  end

  def quantity_sold
    OrderItem.where(item_id: self.id, fulfilled: true).sum(:quantity)
  end
end
