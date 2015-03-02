class AnnouncementsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  before_filter :require_login


	def index
		@announcements=Announcement.all
		@announcements = Announcement.all.order("updated_at desc")
  end

  def create
    @announcement=Announcement.new(announcement_params)
    if @announcement.save
      @latest = Latest.new()
    @latest.announcement_id = @announcement.id
    @latest.user_id = current_user.id
    @latest.save
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

def show
  @announcements = Announcement.all.order("updated_at desc")
  @announcement=Announcement.find(params[:id])
  @visit = Visit.new()
  @visit.visitor_id = current_user.id
  @visit.announcement_id = @announcement.id
  @visit.save
  @visits = Visit.all.order("updated_at desc")
  respond_to do |format|
    format.js{}
  end
end

def home
  @latest = Latest.all.order("updated_at desc")
end



def announcement_params
  params.require(:announcement).permit(:title,:description)
end

end


