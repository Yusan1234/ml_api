class RequestController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'rubygems'
  require 'rmagick'


  def connection
    uploaded_file = params.require(:request)[:img_01]
    # output_path = Rails.root.join('/Users/yu/Documents/samurai/ganpy/ml_api/app/public/aaa.jpg' )
    # File.open(output_path, 'w+b') do |fp|
    #   fp.write uploaded_file.read
    # end
    image_file = File.read(Rails.root.join('/Users/yu/Documents/samurai/ganpy/ml_api/app/public/aaa.jpg'))
    styled_file = File.read(Rails.root.join('/Users/yu/Documents/samurai/ganpy/images/picasso.jpg'))
    base64_image = Base64.strict_encode64(uploaded_file)
    base64_image_style = Base64.strict_encode64(styled_file)
    data = [
      ["content_img", base64_image],
      ['style_img',  base64_image_style]
    ].to_json
    # req.set_form(data, "multipart/form-data")

    url = URI.parse("http://0.0.0.0:8888/predict")
    req = Net::HTTP::Post.new(url.path)
    req.body = data
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    render plain: image_file

  end
  # private
	# def fileupload_param
	#   params.require(:fileupload).permit(:file)
	# end
end