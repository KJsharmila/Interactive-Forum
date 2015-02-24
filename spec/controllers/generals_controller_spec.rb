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
    expect {
    	post :create, {:general => {title: "Mystring",
    		description: "Mystring"}}
    		}.to change(General, :count).by(1)
end
end
