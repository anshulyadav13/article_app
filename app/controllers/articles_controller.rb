class ArticlesController < ApplicationController
    before_action :set_article , only: [:show,:edit,:update,:destroy]
    before_action :require_user ,except: [:index,:show]
    before_action :require_same_user ,only: [:edit,:update,:destroy]
    def index
         @articles = Article.paginate(page: params[:page], per_page: 3)
    end

    def create
         @article = Article.new(get_params);
        @article.user = current_user
        if @article.save
            flash[:notice] = "Article  Saved !"
            redirect_to @article;
        else
            render 'new'
       end
    end
    def new
        @article = Article.new
    end
    def show
    end
    def edit
     end
    def update
         if  @article.update(get_params)
            flash[:notice] = "Article Edited  Sucessfully"
            redirect_to @article 
        else
            render 'edit'
        end

     end
     def destroy
         @article.destroy
          flash[:alert] = "Article Deleted Sucessfully"
        redirect_to articles_path
     end
     
     

     private

     def set_article
        @article = Article.find(params[:id])
     end

     def get_params
        params.require(:article).permit(:title,:description,category_ids: [])
     end
     def require_same_user
        if (@article.user != current_user)  && !current_user.admin? 
            flash[:alert]="You are not allowed to do that action"
            redirect_to @article
        end
     end

end
