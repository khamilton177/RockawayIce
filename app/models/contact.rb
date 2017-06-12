class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :email, uniqueness: { message: "entered is already subscribed.", on: :create }
  validates :email, presence: true, on: :create
  validates :mobile, uniqueness: { message: "number entered is already subscribed." }
  validates :mobile, length: { is: 10 }, allow_blank: true
  validates :mobile, presence: true

end
