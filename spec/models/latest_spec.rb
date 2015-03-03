require 'rails_helper'
RSpec.describe Latest, :type => :model do
 context "Associations" do
  it { should belong_to(:announcement) }
  it { should belong_to(:general) }
end

end
