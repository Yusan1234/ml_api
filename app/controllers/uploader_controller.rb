require 'net/https'
require "open-uri"
class UploaderController < ApplicationController
  def create
    uploaded_file = params.require(:uploader)[:img_01]
    # fname = uploaded_file.original_filename
    fname = 'xxx'
  #   if not ['.png', '.jpg', '.jpeg', '.gif'].include?(File.extname(fname).downcase) then
  #     res = 'error 1'
  #   else
  #     File.open("C:/Yu/Public/#{fname}", 'wb'){|f| f.write(uploaded_file.read)}
  #     res = 'success'
  #   end
  #   render text: res
  # end
  # def upload
  #   @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file) )
  #   # @upload_file.save
  #   redirect_to action: 'index'

    uri = URI.parse("http://0.0.0.0:5000/predict")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    def apipost(file, uri, http)
      req = Net::HTTP::Post.new(uri.path)
      base64_image = Base64.strict_encode64(file)
      # style = open("/assets/picasso.jpg")
      data = [
          ["content_img", base64_image],
          ['style_img',  ]
    ].to_json
      req.set_form(data, "multipart/form-data") 
      res = http.request(req)
    end
      apipost(uploaded_file, uri, http)
    

    response_rb = JSON.parse(response.body)
    result = response_rb['image']
  end
end