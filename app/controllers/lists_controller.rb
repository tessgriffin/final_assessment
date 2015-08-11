class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.includes(:tasks).find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "#{@list.title} created"
      redirect_to root_path
    else
      flash.now[:error] = @list.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:success] = "#{@list.title} updated"
      redirect_to lists_path
    else
      flash[:errors] = @list.errors.full_messages.join(", ")
      render :show
    end 
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy!
    flash[:danger] = "#{@list.title} deleted"
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end