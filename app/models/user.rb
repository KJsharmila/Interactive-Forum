class User < ActiveRecord::Base
  has_many :latests
  has_many :announcements
  has_many :generals
  has_many :comments

 has_secure_password :validations => false

 validates :name, presence: true,
 :unless => proc{|u| u.provider.present?}

 validates :email,
 :presence => true,
 :uniqueness => {:case_sensitive => false},
 :format => {:with => ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP},
 :unless => proc{|u| u.provider.present?}

 validates :password, :presence => true,
 :length => {:minimum => 6},
 :unless => proc{|u| u.provider.present?}, :if => '!password.nil?'

 mount_uploader :image, ImageUploader

 def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
    user
  else
    nil
  end
end

def self.create_with_omniauth(auth)
 create! do |user|
  user.provider = auth['provider']
  user.uid = auth['uid']
  user.oauth_token = auth['oauth_token']
  if auth['info']
    user.name = auth['info']['name'] || ""
  end
end
end

end