module MmGallery
  class ImageArtifact < Artifact

    mount_uploader :file, MmGallery::ImageArtifactsUploader

  end
end
