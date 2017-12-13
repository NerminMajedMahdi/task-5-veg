class CommentsController < ApplicationController
 before_action :set_user, only: [:destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		@user = current_user

		respond_to do |format|
      if @comment.save


        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
         
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end



	
  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    @product = @comment.product(params[:id])
    redirect_to @product, notice: 'Comment has been destroyed successfully'
  end

	private

	  def comment_params
		  params.require(:comment).permit(:user_id, :body, :rating)		
	  end

 def set_user
      @user = current_user
    end

end
