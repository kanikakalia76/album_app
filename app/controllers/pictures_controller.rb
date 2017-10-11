
class PicturesController < ApplicationController

def new
 @myalbum = Myalbum.find(params[:myalbum_id])
end

  def create
    @myalbum = Myalbum.find(params[:myalbum_id])
    @picture = @myalbum.pictures.new(picture_params)
      if @picture.save
        redirect_to myalbum_path(@myalbum)
      end
  end

  def destroy
    @myalbum = Myalbum.find(params[:myalbum_id])
    #@picture = current_user.myalbums.picture_path(params[:id])
    @picture = @myalbum.pictures.find_by(params[:id])
    #remove_image_at_index(params[:id].to_i)
    @picture.destroy
    redirect_to myalbum_path(@myalbum)
  end

  def show
    @myalbum = Myalbum.find(params[:myalbum_id])
     @picture = @myalbum.pictures.find_by(params[:id])
    #@picture = Picture.where(album_id: @myalbum.id)
    redirect_to myalbum_picture_path(@myalbum,@picture)
  end

  def index
    #@picture = Picture.all

    #added tag code
    #@picture =  if params[:tag]
    #@myalbum = Myalbum.find(params[:myalbum_id])
    if params[:tag]
    @pictures = Picture.tagged_with(params[:tag])
    else
      Picture.all
    end
  end

  private
    def picture_params
      params.require(:picture).permit(:photo, :tag_list)
    end

  #added delete code
    #def remove_image_at_index(index)
       #remain_images = @myalbum.pictures
     #deleted_image = remain_images.delete_at(index)
     #deleted_image.try(:remove!)
   #end

end

