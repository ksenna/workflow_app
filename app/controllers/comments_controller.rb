class CommentsController < ApplicationController

	def new
		@user_id = params.delete(:user_id)
		@commentable = find_commentable
		@comment = Comment.new(:user_id => @user_id, :commentable_id => @commentable_id, :commentable_type => @commentable.class.to_s)
	end

	def create
		@new_comment = Comment.new(comment_params)
		if @new_comment.save
			redirect_to :back
		else
			# redirect_to assignment_path(@comment.assignment)
			"Error creating comment"
		end
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      "Error updating comment"
    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to comments_path
		else
			redirect_to comment_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:user_id, :content, :commentable_type, :commentable_id, sessions_attributes: [:user_id])
	end

end