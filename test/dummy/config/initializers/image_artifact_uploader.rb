class MountableGallery::ImageArtifactsUploader

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

end
