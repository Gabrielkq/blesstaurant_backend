class RestaurantsController < ApplicationController

    def search
     search_term = request.headers['Search']
     response = YelpSearch.new("#{search_term}")
     array = response.results["businesses"]
        if array.nil?
            array = []
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
        render json: {selected_restaurant: obj} 
     end



end
