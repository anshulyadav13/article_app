module ApplicationHelper
    def load_profile_image
        random_num = rand(0..80)
         src = "https://randomuser.me/api/portraits/men/#{random_num}.jpg"
        image_tag src ,class:"rounded mx-auto d-block  shadow"
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user
    end
end
