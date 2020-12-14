class Restaurant < ApplicationRecord

    validates_presence_of :yelp_id
    validates_presence_of :name
    validates :yelp_id, uniqueness: true

end
