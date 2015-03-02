class Visit < ActiveRecord::Base
  belongs_to :announcement
   belongs_to :general
end
