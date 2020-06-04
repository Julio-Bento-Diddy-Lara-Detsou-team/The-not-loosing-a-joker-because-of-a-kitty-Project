class Cart < ApplicationRecord
  has_one :user
  has_many :shopping_sessions
  has_many :items, through: :shopping_sessions
end
