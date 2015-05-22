# encoding: utf-8

class PostUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
   include CarrierWave::RMagick
   include Cloudinary::CarrierWave
   # Crop to 275px, 206px
   version :thumbnail do
       process resize_to_fill: [275, 206]
   end

   # crop to 62px, 62px
   version :mini_tumbnail do
       process resize_to_fill: [62, 62]
   end

   # crop to 870px, 261px
   version :detail do
       process resize_to_fill: [870, 261]
   end

   # Allowed image format
   def extension_white_list
        %w(jpg jpeg gif png)
   end
  # Choose what kind of storage to use for this uploader:

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end