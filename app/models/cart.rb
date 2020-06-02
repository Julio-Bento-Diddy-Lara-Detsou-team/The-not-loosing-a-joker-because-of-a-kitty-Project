class Cart < ApplicationRecord
  has_one :user
  has_many :items, through: :shopping_session
end
