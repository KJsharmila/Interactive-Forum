require 'rails_helper'

RSpec.describe General, :type => :model do
	let(:general) {FactoryGirl.create(:general)}
  context "Factory settings for users" do

    it "should validate the general factories" do
      expect(FactoryGirl.build(:general).valid?).to be true
    end
  end
  describe General do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description}
  end

  it "should validate title lenght" do
   general.title = "ruby"*30
   expect(general).to be_invalid

   general.title = "ruby on rails"
   expect(general).to be_valid


 end
  
end
