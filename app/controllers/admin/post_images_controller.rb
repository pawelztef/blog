class Admin::PostImagesController < Admin::ApplicationController
  respond_to :json

  def create
    geometry = Paperclip::Geometry.from_file params[:file]
    post_image = PostImage.create params.permit(:file, :alt, :hint)
    post_image_url = post_image.file.url

    render json: {
      image: {
        url:  post_image_url, 
        height: geometry.height.to_i,
        width:  geometry.width.to_i
      }
    }, layout: false, content_type: "text/html"
  end

end
