class KittensController < ApplicationController

  def index
    @kittens = Kitten.all

    respond_to do |format|
     format.html # index.html.erb
     format.xml  { render :xml => @kittens }
     format.json { render :json => @kittens }
   end
  end

  def new
    @kitten = Kitten.new()
  end

  def create
    @kitten = Kitten.new(kitten_params)
      if @kitten.save
          redirect_to root_path
          flash[:notice] = "Kitten was created."
        else
          flash[:alert] = "Kitten was not created."
      end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
     format.html # index.html.erb
     format.xml  { render :xml => @kitten }
     format.json { render :json => @kitten }
   end

  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
    flash[:notice] = "Kitten was updated successfully"
    redirect_to root_path
      else
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness)
  end


end
