class ApplicationController < ActionController::API
end
class ApplicationController < ActionController::API
 
    private
    
         def hmac_secret
               ENV["HMAC_SECRET"]
        end

        def encode_token(user_id)
            payload = { user_id: user_id }
            JWT.encode(payload, hmac_secret, 'HS256')
        end
    
        def client_has_valid_token?
         !!session_user
        end
    
        def decoded_token
            begin
                token = request.headers['Authorization']
                decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
                payload = decoded_array.first
             rescue
                 return nil
             end
             payload["user_id"]
        end
    
        def session_user
            user = User.find_by(id: decoded_token)
        end

    end
    