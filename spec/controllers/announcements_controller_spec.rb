require 'rails_helper'

RSpec.describe AnnouncementsController, :type => :controller do
	let(:user) {FactoryGirl.create(:user)}

let(:announcement) {FactoryGirl.create(:announcement)}
let(:visit) {FactoryGirl.create(:visit)}

  it "should create topics" do
    announcement_params = {
      announcement: {
        title: "Mystring",
        description: "Mystring"

      }
    }
    session[:user_id]= user.id
    post :create, announcement_params
    expect(Announcement.count).to eq 1
end

describe "GET index" do
    it "assigns all announcements as @announcement" do
      get :index
      assigns(:announcements).should eq(@announcement)
      assigns(:visits).should eq(@visit)
    end
  end
end
