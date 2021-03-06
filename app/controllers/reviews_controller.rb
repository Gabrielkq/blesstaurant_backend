class ReviewsController < ApplicationController

    def create
        review = Review.create(review_params)
        if review.valid?
            render json: ReviewSerializer.new(review).to_serialized_json
        else
            render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def restaurant_reviews
        reviews = Review.where(restaurant_id: request.headers['Rest-id'])
        if reviews.nil?
            render json: []
        else
            render json: ReviewSerializer.new(reviews).to_serialized_json
        end
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: {}, status: 200
    end
    

private

    def review_params
        params.permit(:content, :rating, :user_id, :restaurant_id)
    end

end
