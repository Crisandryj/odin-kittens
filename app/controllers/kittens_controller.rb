class KittensController < ApplicationController

  def index
    Kitten.all
  end

  def new
    @kitten = Kitten.new()
  end

  def create
    @kitten = Kitten.new(kitten_params)
      if @kitten.save
          redirect_to root_path
      end
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    if @kitten.update(kitten_params)
    flash[:notice] = "Kitten was updated successfully"
    redirect_to @kitten
  else
  render 'edit'
  end


  def destroy
    @kitten.destroy
    redirect_to root_path
  end
