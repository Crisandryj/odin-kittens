class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new()
  end

  def create
    @kitten = Kitten.new(kitten_params)
      if @kitten.save
          redirect_to root_path
          flash.now[:notice] = "Kitten was created."
        else
          flash.now[:alert] = "Kitten was not created."
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
  end

  def destroy
    @kitten.destroy
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:name).permit(:age,:cuteness,:softness)
  end

end
