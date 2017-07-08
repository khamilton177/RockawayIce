class Admin < ActiveRecord::Base
  # validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 8 }
  validates :super, presence: true

  def self.from_omniauth(auth)
      admin = Admin.where(email: auth.info.email).first
      admin
  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, email: auth.info.email).first_or_initialize.tap do |admin|
  #     admin.provider = auth.provider
  #     admin.uid = auth.uid
  #     admin.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     admin.save!
  #   end
  # end



end
