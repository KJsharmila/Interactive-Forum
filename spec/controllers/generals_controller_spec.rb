require 'rails_helper'

RSpec.describe GeneralsController, :type => :controller do
	let(:user) {FactoryGirl.create(:user)}

let(:general) {FactoryGirl.create(:general)}

  it "should create topics" do
    general_params = {
      general: {
        title: "Mystring",
        description: "Mystring"
        
      }
    }
    session[:user_id]= user.id
    post :create, general_params
    expect(General.count).to eq 1
end
end
