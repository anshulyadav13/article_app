class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
         @user = User.new(get_url_params)
         if @user.save
            flash[:notice] ="Sucessfully signed Up"
            redirect_to articles_path
        else
            render 'new'
         end

    end

    def edit
        @user = User.find(params[:id])
    end
    def update
         @user = User.find(params[:id])
         if @user.update(get_url_params)
            flash[:notice] ="Profile Successfully Updated"
            redirect_to articles_path
         else
            render 'edit'
         end


         # if User.update(get_url_params)

    end


    private
    def get_url_params
        params.require(:user).permit(:user_name,:email,:password)
     end

end