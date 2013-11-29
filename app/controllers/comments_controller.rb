class CommentsController < ApplicationController
  before_filter :load_commentable
  before_filter :authenticate_user!

  def index
    @comments = @commentable.comments
  end

  def show
    @comment = @commentable
  end

  def new
    @comment = @commentable.comments.new
  end

  def edit
    @comment = @commentable.comment(@commentable)
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @commentable, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private

    def get_news
      @news = Newsitem.all.last(5)
    end

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
    end
end
