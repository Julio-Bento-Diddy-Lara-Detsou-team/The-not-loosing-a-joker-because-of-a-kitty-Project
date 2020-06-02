class Cart < ApplicationRecord
  has_one :user
  has_many :items, throught: :shopping_session
end
