class NewsitemsController < ApplicationController
  before_action :set_newsitem, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin_user!, only: [:create, :update, :edit, :destroy]

  def index
    @newsitems = Newsitem.all.order('created_at DESC').page(params[:page]).per(5)
  end

  def show
    @commentable = @newsitem
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @newsitem = Newsitem.new
  end

  def edit
  end

  def create
    @newsitem = Newsitem.new(newsitem_params)
    @newsitem.user_id = current_user.id

    respond_to do |format|
      if @newsitem.save
        format.html { redirect_to newsitems_path, notice: 'Newsitem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newsitem }
      else
        format.html { render action: 'new' }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @newsitem.update(newsitem_params)
        format.html { redirect_to newsitems_path, notice: 'Newsitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @newsitem.destroy
    respond_to do |format|
      format.html { redirect_to newsitems_url }
      format.json { head :no_content }
    end
  end

  private
    def set_newsitem
      @newsitem = Newsitem.find(params[:id])
    end

    def newsitem_params
      params.require(:newsitem).permit(:title, :description, :date, :user_id)
    end
end
