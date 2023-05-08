class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def create
        @article = Article.new(params.require(:article).permit(:title,:description));
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
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if  @article.update(params.require(:article).permit(:title,:description))
            flash[:notice] = "hey you just edited the article"
            redirect_to @article 
        else
            render 'edit'
        end

     end
     def destroy
        Article.destroy(params[:id])
         flash[:alert] = "article deleted"
        redirect_to articles_path
     end
end