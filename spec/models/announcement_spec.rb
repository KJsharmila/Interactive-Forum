require 'rails_helper'
RSpec.describe Announcement, :type => :model do
  let(:announcement) {FactoryGirl.create(:announcement)}
  context "Factory settings for users" do

    it "should validate the announcement factories" do
      expect(FactoryGirl.build(:announcement).valid?).to be true
    end
  end
  describe Announcement do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description}
  end

  it "should validate title lenght" do
   announcement.title = "ruby"*30
   expect(announcement).to be_invalid

   announcement.title = "ruby on rails"
   expect(announcement).to be_valid


 end
end
