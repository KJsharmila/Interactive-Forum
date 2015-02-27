class Announcement < ActiveRecord::Base
  has_many :visit
	validates :title,
	:presence => true,
	:length => {:maximum => 30}

	validates :description, :presence => true

end
