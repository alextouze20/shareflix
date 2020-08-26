class ReviewsController < ApplicationController

  def create
    @review = Review.new(strong_review)
    @review.account_owner_id = current_user.id
    @review.account_tenant_id = params[:profile_id]
    authorize @review
    if @review.save
      redirect_to profile_path(params[:profile_id])
    else
      redirect_to profile_path(
        params[:profile_id],
        commit: "Create Review",
        review: {
          content: params[:review][:content],
          rating: params[:review][:rating]
        }
      )
    end
  end

  private

  def strong_review
    params.require(:review).permit(:content, :rating)
  end
end
