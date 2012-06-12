# encoding: utf-8

class MountableGallery::IconUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file # :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  [32, 48, 56, 64].each do |size|
    version :"icon#{size}" do
      process :resize_to_fit => [size, size]
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
