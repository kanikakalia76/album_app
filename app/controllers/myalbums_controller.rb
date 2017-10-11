class MyalbumsController < ApplicationController
def new
  @myalbum =Myalbum.new 
  @myalbum.pictures.new
  #@myalbum = Myalbum.find(params[:id])
  #@myalbum.pictures.build
end

def create
  @myalbum = current_user.myalbums.new(myalbum_params)
  
  if @myalbum.save
    redirect_to @myalbum
  else
    render 'new'
  end
end

def index
    @myalbum = current_user.myalbums
end

def show
@myalbum = Myalbum.find(params[:id])
end

def edit
  @myalbum = Myalbum.find(params[:id])
end

  def destroy
      @myalbum = Myalbum.find(params[:id])
      @myalbum.destroy

      redirect_to myalbums_path
  end

  def update
    @myalbum = Myalbum.find(params[:id])
      if @myalbum.update(myalbum_params)
      redirect_to @myalbum
      else
      render 'edit'
      end
  end
end

private
  def myalbum_params
    params.require(:myalbum).permit(:name, :description, pictures_attributes: [:photo] )
  end

