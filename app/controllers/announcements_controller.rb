class AnnouncementsController < ApplicationController
	def index
	end
	def create
		@announcement=Announcement.new(announcement_params)
	end
	def new
		
	end
	def announcement_params
		params.require(:announcement).permit(:title,:description)
	end
end


