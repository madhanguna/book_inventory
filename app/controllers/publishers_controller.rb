class PublishersController < ApplicationController
  
  before_filter :authorize ,only: [:edit,:update,:create,:destroy,:index] 

  def new
    @publisher=Publisher.new
  end

  def index
    @publisher=Publisher.all
  end

  def show
    @publisher=Publisher.find(params[:id])
  end

  def edit
    @publisher=Publisher.find(params[:id])
  end

  def create
    @publisher=Publisher.new(publisher_params)
    if @publisher.save
      render 'show'
    else
      render 'new'
    end
  end

  def update
    @publisher=Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      redirect_to @publisher
    else
      render 'edit'
    end
  end


  def destroy
    @publisher=Publisher.find(params[:id])
    @publisher.destroy
    redirect_to @publisher
  end

  private
  def publisher_params
    params.require(:publisher).permit(:name)
  end
  
end
