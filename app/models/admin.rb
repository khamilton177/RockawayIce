class Admin < ApplicationRecord
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :super, presence: true
end
