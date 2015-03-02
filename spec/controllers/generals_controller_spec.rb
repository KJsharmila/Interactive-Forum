require 'rails_helper'

RSpec.describe GeneralsController, :type => :controller do
	let(:user) {FactoryGirl.create(:user)}

let(:general) {FactoryGirl.create(:general)}
let(:visit) {FactoryGirl.create(:visit)}
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
describe "GET index" do
    it "assigns all announcements as @announcement" do
      get :index
      assigns(:generals).should eq(@general)
      assigns(:visits).should eq(@visit)
    end
  end
end
