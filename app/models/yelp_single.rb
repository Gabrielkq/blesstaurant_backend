
class YelpSingle

    attr_reader :result
  
    def initialize(id)
      url = "https://api.yelp.com/v3/businesses/#{id}"
      response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url)
      @result = response.parse
    end
  
  
  end