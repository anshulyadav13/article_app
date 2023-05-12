class UsersController < ApplicationController
    before_action :get_user , only: [:show,:update,:edit]
    def new
        @user = User.new
    end
    def create
         @user = User.new(get_url_params)
         if @user.save
            flash[:notice] ="Sucessfully signed Up"
            redirect_to @user
        else
            render 'new'
         end

    end

    def edit
     end
    def update
          if @user.update(get_url_params)
            flash[:notice] ="Profile Updated Successfully "
            redirect_to @user
         else
            render 'edit'
         end
    end
    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end
    def index
        @users = User.paginate(page: params[:page], per_page: 3)

    end

    private
    def get_url_params
        params.require(:user).permit(:user_name,:email,:password)
    end
    def get_user
        @user = User.find(params[:id])
    end

end