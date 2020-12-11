
class YelpSearch

    attr_reader :results
  
    def initialize(search_term)
      url = "https://api.yelp.com/v3/businesses/search"
      params = {
        term: "vegan",
        categories: "vegan",
        location: search_term,
        limit: 25
      }
  
      response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: params)
      @results = response.parse
    end
  
  
  end