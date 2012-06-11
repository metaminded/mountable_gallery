module MmGallery
  class ImageArtifact < Artifact

    mount_uploader :file, MmGallery::ImageArtifactsUploader
    mount_uploader :icon, MmGallery::IconUploader

    before_validation do
      if file_changed?
        self.icon = file
      end
    end

  end
end
