class ReviewsController < ApplicationController

    def create
        review = Review.create(review_params)
        if review.valid?
            render json: review
        else
            render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

private

    def review_params
        params.permit(:content, :rating, :user_id, :restaurant_id)
    end

end
