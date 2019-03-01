class ImagesController < ApplicationController

  def index

  end

  def login
    #user = params.require(:image).permit(:user,:password)
    user = params[:user]
    pass = params[:password]
    bool = "false"
    #File.open("app/controllers/login.txt","r").each_line do |line|
      #data = line.split(/\t/)
      #username = data[0]
      #password = data[1].gsub("\n","")
      if (user == "admin" and pass == "password")
        bool = "true"
      end
    #end
    if bool == "true"
      session[:user] = user
      redirect_to action: "upload"
    else
      flash.now[:danger] = "Invalid username or password."
      render action: "index"
    end
  end

  def upload
    @path = params[:path]
    if @path == nil
      @path = "international/kitchenware"
    end
    @images = Dir.glob("/home/ninequeens/websites/snbenterprises-website/public/images/enterprises/products/#{@path}/*.*")
  end

  def image_upload
    path = params[:path]
    file = params[:picture]
    File.open('/home/ninequeens/websites/snbenterprises-website/public/images/enterprises/products/'+path+'/'+file.original_filename, 'wb') do |f|
      f.write(file.read)
    end
      redirect_to upload_images_path(path: path)
  end

  def destroy_session
    reset_session
    redirect_to action: "index"
  end

  def destroy
    file_name = params[:name]
    File.delete(Rails.root.join('/home/ninequeens/websites/snbenterprises-website/public/images/enterprises/products/',file_name))
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

end