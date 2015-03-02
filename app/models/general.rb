class General < ActiveRecord::Base
  has_many :visits
  has_many :latests
	validates :title,
	:presence => true,
	:length => {:maximum => 30}

	validates :description, :presence => true
end
