class ReviewSerializer

    def initialize(review_object)
        @review = review_object
    end

    def to_serialized_json
        @review.to_json(:include => {
            :user => {:only => [:username]},
            :restaurant => {:only => [:name]}
        },
        :except => [:updated_at])
    end

end