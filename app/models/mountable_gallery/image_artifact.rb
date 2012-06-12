module MountableGallery
  class ImageArtifact < Artifact

    mount_uploader :file, MountableGallery::ImageArtifactsUploader
    mount_uploader :icon, MountableGallery::IconUploader

    before_validation do
      if file_changed?
        self.icon = file
      end
    end

  end
end
