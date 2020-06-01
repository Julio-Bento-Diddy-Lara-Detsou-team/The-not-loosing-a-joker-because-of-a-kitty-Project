class Item < ApplicationRecord
  has_many :shopping_sessions
  has_many :carts, through: :shopping_sessions

  has_many :order_items
  has_many :orders, through: :order_items

  # validates :title,
  #           presence: true,
  #           length: {in: 3..25}
  #
  # validates :description,
  #           length: {maximum: 1500}
  # validates :image_url,
  #           presence: true
  # validates :price,
  #           presence: true,
  #           numericality: { greater_than: 0, less_than: 100 }
end
