class Contact < ApplicationRecord

  validates :first_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true 
  validates :mobile, uniqueness: true
  # validates :mobile, numericality: true, on: :create
  validates :mobile, length: { is: 10 }, allow_blank: true
  validates :mobile, presence: true
  #{unless: Contact.new { | cnt | cnt.email.present?}, message: "You must supply atleast an email or mobile #."}

end
