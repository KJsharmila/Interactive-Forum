require 'rails_helper'
RSpec.describe Latest, :type => :model do
 context "Associations" do
  it { should belong_to(:announcement) }
  it { should belong_to(:general) }
  it { should belong_to(:user) }
end

end
