module ApplicationHelper
    def load_profile_image
        random_num = rand(0..80)
        puts "this is random #{random_num}"
        src = "https://randomuser.me/api/portraits/men/#{random_num}.jpg"
        image_tag src ,class:"rounded mx-auto d-block  shadow"
    end
end
