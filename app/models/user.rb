class User < ActiveRecord::Base
  
   has_secure_password

 validates :name,
 presence: true, 
 :format => { with: /\w+/ },
 :format => { with: /[A-Z]/}

 validates :email,
      presence: true,
      uniqueness: {message: "Email already exists"}
  
  validates :password,
 :presence => true, 
 :length => {:minimum => 4}
end