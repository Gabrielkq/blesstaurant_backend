class RestaurantsController < ApplicationController

    def search
     search_term = request.headers['Search']
     response = YelpSearch.new("#{search_term}")
     array = response.results["businesses"]
        if array.nil? || array.length == 0
            array = [none: "no results found"]
        end
     render json: {restaurants: array} 
    end

    def get_restaurant
        yelp_id = request.headers['Yelp-Id']
        single_response = YelpSingle.new("#{yelp_id}")
        obj = single_response.result
            if obj.nil?
                obj = {}
           end
           if obj["error"]
               render json: {error: "redirect"}
           end
        render json: {yelp_restaurant: obj} 
     end

    def create
        restaurant = Restaurant.create(restaurant_params)
        if restaurant.valid?
            render json: restaurant
        else
            render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def find
        restaurant = Restaurant.find_by(yelp_id: request.headers['Yelp-Id'])
        if restaurant.nil?
            render json: {restaurant_id: 0}
        else
            render json: {restaurant_id: restaurant.id}
        end
    end
private
    def restaurant_params
        params.permit(:yelp_id, :name)
    end

end
