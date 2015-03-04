class Announcement < ActiveRecord::Base
  has_many :visits
  has_many :latests
  belongs_to :user
	validates :title,
	:presence => true,
	:length => {:maximum => 30}

	validates :description, :presence => true

end
