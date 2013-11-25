class NewsitemsController < ApplicationController
  before_action :set_newsitem, only: [:show, :edit, :update, :destroy]
  before_action :get_news


  # GET /newsitems
  # GET /newsitems.json
  def index
    @newsitems = Newsitem.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)
  end

  # GET /newsitems/1
  # GET /newsitems/1.json
  def show
    @commentable = @newsitem
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /newsitems/new
  def new
    @newsitem = Newsitem.new
  end

  # GET /newsitems/1/edit
  def edit
  end

  # POST /newsitems
  # POST /newsitems.json
  def create
    @newsitem = Newsitem.new(newsitem_params)
    @newsitem.user_id = current_user.id

    respond_to do |format|
      if @newsitem.save
        format.html { redirect_to @newsitem, notice: 'Newsitem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newsitem }
      else
        format.html { render action: 'new' }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newsitems/1
  # PATCH/PUT /newsitems/1.json
  def update
    respond_to do |format|
      if @newsitem.update(newsitem_params)
        format.html { redirect_to @newsitem, notice: 'Newsitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @newsitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsitems/1
  # DELETE /newsitems/1.json
  def destroy
    @newsitem.destroy
    respond_to do |format|
      format.html { redirect_to newsitems_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsitem
      @newsitem = Newsitem.find(params[:id])
    end

    def get_news
      @news = Newsitem.all.last(5)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsitem_params
      params.require(:newsitem).permit(:title, :description, :date, :user_id)
    end
end
