require 'rails_helper'

RSpec.describe User::UsersController, :type => :controller do

  let(:user) {FactoryGirl.create(:user)}


describe "GET create" do
    it "should add a users" do
      user_params = {
        user: {

          name: "Mystring",
          email: "sharmil@yopmail.com",
          password: ConfigCenter::Defaults::PASSWORD,
          password_confirmation: ConfigCenter::Defaults::PASSWORD
        }
      }
  expect do
      post :create, user_params
      end.to change(User, :count).by(1)
    end
  end
end