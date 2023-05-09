class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :user_name ,presence: true,length:{minimum:3,maximum:25},uniqueness:{case_sensitive:false}
    validates :email ,presence: true,length:{maximum:100},format:{with:VALID_EMAIL_REGEX}
end
