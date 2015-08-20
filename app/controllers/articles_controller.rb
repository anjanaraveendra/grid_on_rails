class ArticlesController < ApplicationController
  def index
  end

  def data
    articles = Article.all
    
    render :json => {
      :total_count => articles.length,
      :pos => 0,
      :rows => articles.map do |article|
        {
          :id => article.id,
          :data => [article.title, article.author, article.edition_number]
        }
      end
    }
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    title = params["c0"]
    author = params['c1']
    edition_number = params['c2']
    
    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      article = Article.create :title => title, :author => author, :edition_number => edition_number
      @tid = user.id
      
    when "deleted"
      Article.find(@id).destroy
      @tid = @id 
      
    when "updated"
      article = Article.find(@id)
      article.title = title
      article.author = author
      article.edition_number = edition_number
	  article.save
      @tid = @id
    end
  end
end
