class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  after_create :order_email_send

  def order_email_send
    OrderMailer.order_email(self).deliver_now
  end
end
