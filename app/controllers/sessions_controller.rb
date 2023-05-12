class SessionsController < ApplicationController
    def new 
        
    end
    def create
        user = User.find_by email: params[:sessions][:email] 
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id] = user.id
            flash[:notice]  = "Sucessfully Loged IN"
            redirect_to user
        else
            flash.now[:notice]="Email or Password Did Not Mathed!"
            render 'new'
        end
     end
    def destroy
        session[:user_id]= nil 
        flash[:notice] = "You Have Sucessfully Logged out"
        redirect_to root_path
    end

end