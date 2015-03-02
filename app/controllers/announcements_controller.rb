class AnnouncementsController < ApplicationController
	skip_before_filter  :verify_authenticity_token


	def index
		@announcements=Announcement.all
		@announcements = Announcement.all.order("updated_at desc")
	end
	

	def create
		@announcement=Announcement.new(announcement_params)
		if @announcement.save
			redirect_to announcements_path
		else
			redirect_to '/'
		end
	end

	def new
		@announcement = Announcement.new
	end

	def preview
	end

	def announcement_params
		params.require(:announcement).permit(:title,:description)
	end

end


