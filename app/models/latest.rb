class Latest < ActiveRecord::Base
  belongs_to :announcement
  belongs_to :general
  belongs_to :user
end
