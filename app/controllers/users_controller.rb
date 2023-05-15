class UsersController < ApplicationController
    before_action :get_user , only: [:show,:update,:edit,:destroy]
    before_action :require_user, only: [:edit,:update,:destroy]
    before_action :require_same_user, only: [:edit,:update,:destroy]
    def new
        @user = User.new
    end
    def create
         @user = User.new(get_url_params)
         if @user.save
            flash[:notice] ="Sucessfully signed Up"
            session[:user_id]=@user.id
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
    
     def all_articles
        if logged_in?
        @articles = current_user.articles.paginate(page: params[:page], per_page: 2)  
        else
            redirect_to articles_path
        end
     end

     def destroy
        @user.destroy
        session[:user_id]=nil if !current_user.admin? 
        flash[:alert] = 'Account and its related Articles deleted sucessfully'
        redirect_to root_path
     end
    private
    def get_url_params
        params.require(:user).permit(:user_name,:email,:password)
    end
    def get_user
        @user = User.find(params[:id])
    end
    def require_same_user
        if (current_user != @user)  && (!current_user.admin?) 
            flash[:alert] = "you can edit or delete your own account"
            redirect_to @user
        end
    end

end