class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # validates :delivery_address, presence: true
end

