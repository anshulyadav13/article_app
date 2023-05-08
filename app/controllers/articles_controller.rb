class ArticlesController < ApplicationController
    before_action :set_article , only: [:show,:edit,:update,:distroy]
    def index
        @articles = Article.all
    end
    def create
        @article = Article.new(get_params);
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
            flash[:notice] = "hey you just edited the article"
            redirect_to @article 
        else
            render 'edit'
        end

     end
     def destroy
          flash[:alert] = "article deleted"
        redirect_to articles_path
     end
     
     private

     def set_article
        @article = Article.find(params[:id])
     end

     def get_params
        params.require(:article).permit(:title,:description)
     end

end
