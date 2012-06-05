# encoding: utf-8

class MmGallery::ImageArtifactsUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :size80 do
    process :resize_to_fit => [80, 60]
  end

  # preview
  version :size160 do
    process :resize_to_fit => [160, 120]
  end

  # ipad 2 grid item
  version :size240 do
    process :resize_to_fit => [240, 180]
  end

  # ipad 2 product details view
  version :size448 do
    process :resize_to_fit => [448, 336]
  end

  # ipad 3 grid item
  version :size480 do
    process :resize_to_fit => [480, 360]
  end

  # ipad 3 product details view
  version :size896 do
    process :resize_to_fit => [896, 672]
  end

  # version :small do
  #   process :resize_to_fit => [275, 275]
  # end
  #
  # version :gallery_width do
  #   process :resize_to_fit => [540, 405]
  # end
  #
  # version :full_width do
  #   process :resize_to_fit => [768, 576]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  # def filename
  #   "#{timestamp}.#{file.extension}" if original_filename
  # end

  private

  # def timestamp
  #   ivar = "@#{mounted_as}_timestamp"
  #   time = model.instance_variable_get(ivar)
  #   time ||= model.instance_variable_set(ivar, Time.now().strftime("%s"))
  # end
end
