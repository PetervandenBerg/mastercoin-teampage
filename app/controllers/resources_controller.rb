class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @resources = Resource.all
  end

  def show
  end

  def new
    @resource = Resource.new
  end

  def edit
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id

    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_path, notice: 'Resource was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resource }
      else
        format.html { render action: 'new' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end

  private
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :description, :image, :category)
    end
end
