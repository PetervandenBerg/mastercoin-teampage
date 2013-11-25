class PagesController < ApplicationController
  before_action :get_news

  def home
  end

  def features
  end

  def resources
  end

  def contact
  end

  def teampage
    @users = User.all.where(kind: 2).paginate(:page => params[:page], :per_page => 15)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  private 

  def get_news
    @news = Newsitem.all.last(5)
  end

end
