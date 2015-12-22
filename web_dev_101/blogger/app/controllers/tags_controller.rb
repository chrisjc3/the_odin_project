class TagsController < ApplicationController
	def show
		@tag = Tag.find(params[:id])
	end
	def index
		@tags = Tag.all
	end
	def destroy
		@tags = Tag.find(params[:id])
		@tags.destroy
		flash.notice = "Article '#{@tags.name}' Deleted!"
		redirect_to "http://localhost:3000/tags/"
	end
end
