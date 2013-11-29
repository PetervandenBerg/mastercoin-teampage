class PagesController < ApplicationController

  def home
  end

  def features
  end

  def resources
  end

  def contact
  end

  def teampage
    @users = User.all.where(kind: ["Staff", "Admin"]).page(params[:page]).per(15)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

end
