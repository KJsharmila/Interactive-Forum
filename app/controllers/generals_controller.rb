class GeneralsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
  before_filter :require_login

  def index
    @generals = General.all.order("updated_at desc")
    @visits = Visit.all
  end

  def create
    @general=General.new(general_params)
    @general.user_id = current_user.id
    if @general.save
      @latest = Latest.new()
      @latest.general_id = @general.id
       @latest.user_id = current_user.id
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

def edit
  @latest=Latest.find(params[:id])
  @comments = Comment.all.where(general_id: @latest.general_id)
  end

  def update
    @latest=Latest.find(params[:id])
    @comment = Comment.new(params.require(:comment).permit(:comment_text))
    if @comment.comment_text.present?
    @comment.general_id = @latest.general_id
    @comment.user_id = current_user.id
    @comment.save
     UserMailer.send_email(@latest,@comment).deliver
  end
    comments = Comment.all.where(general_id: params[:id].to_i)
    redirect_to edit_general_path(@latest)
  end

def general_params
  params.require(:general).permit(:title,:description)
end
end
