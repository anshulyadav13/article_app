class CategoriesController < ApplicationController
    before_action :require_admin ,except: [:index,:show]
    before_action :get_category ,only:[:show,:edit,:update]

    def index
        @categories = Category.all.paginate(page: params[:page], per_page: 5)  
    end
    
    def show
        @articles = @category.articles.paginate(page: params[:page], per_page: 3)
    end

    def edit
    end
    
    def new
        @category = Category.new
    end
    def create 
        @category = Category.create(category_params)
         if @category.save
            flash[:notice]="Category Created Sucessfully"
            redirect_to @category
         else
             render 'new'
         end

    end

    def update 
        if @category.update(category_params)
             
            flash[:notice]="Category Updated Sucessfully"
            redirect_to @category
         else
             render 'edit'
         end
    end

    private

    def category_params
        params.require(:category).permit(:name)
        
    end
    def require_admin
        if !(logged_in? && current_user.admin )
            flash[:alert] = "Only Admins are allowed to do this action"
            redirect_to categories_path
        end
    end

    def get_category
         @category = Category.find(params[:id])        
    end

end