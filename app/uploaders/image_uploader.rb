class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  mount_uploader :file, UploadFileUploader
  def create
    uploaded_file = fileupload_param[:file]
    output_path = Rails.root.join('public', uploaded_file.original_filename)
    File.open(output_path, 'w+b') do |fp|
    fp.write  uploaded_file.read
    redirect_to action: 'index'
    end

  def upload
    @upload_file = UploadFile.new( params.require(:upload_file).permit(:name, :file) )
    # @upload_file.save
    redirect_to action: 'index'
  end
  def submit
    require 'net/https'

    @uri = URI.parse("http://0.0.0.0:5000/predict")
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    def apipost(file)
      req = Net::HTTP::Post.new(@uri.path)
      base64_image = Base64.strict_encode64(file)
      data = [
          ["image", base64_image],
    ].to_json
      # req.set_form(data, "multipart/form-data") DB使わないから
      res = @http.request(req)
    end
      apipost(@upload_file)
    end

    response_rb = JSON.parse(response.body)
    result = response_rb['image']
  end
end