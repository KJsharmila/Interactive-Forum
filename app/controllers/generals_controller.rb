class GeneralsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  before_filter :require_login

  def index
    @generals = General.all.order("updated_at desc")
  end

  def create
    @general=General.new(general_params)
    if @general.save
      @latest = Latest.new()
      @latest.general_id = @general.id
      @latest.save
      redirect_to generals_path
    else
     redirect_to '/'
   end
 end


 def show
  @generals = General.all.order("updated_at desc")
  @general=General.find(params[:id])
  @visit = Visit.new()
  @visit.visitor_id = current_user.id
  @visit.general_id = @general.id
  @visit.save
  respond_to do |format|
    format.js{}
  end
end

def new
  @general =General.new
end
def previews
end


def general_params
  params.require(:general).permit(:title,:description)
end
end
