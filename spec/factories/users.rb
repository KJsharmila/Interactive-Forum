FactoryGirl.define do
  factory :user do
    name "MyString"
    email "shar@gmail.com"
    password ConfigCenter::Defaults::PASSWORD


  end

end
