class Supplier < ApplicationRecord
  has_many :products

  validates :name, :email, :phone, presence: true, uniqueness: true
end
