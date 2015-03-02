class GeneralsController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	def index
		@generals = General.all.order("updated_at desc")
	end

	def create
		@general=General.new(general_params)
		if @general.save
			redirect_to generals_path
		else
			redirect_to '/'
		end
	end

	def new
		@general =General.new
	end

	def general
	end

	def general_params
		params.require(:general).permit(:title,:description)
	end
end
