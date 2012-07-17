module MountableGallery
  class DocumentArtifact < Artifact

    mount_uploader :file, MountableGallery::DocumentArtifactsUploader

    def icon_url(size)
      file_string = self.file.to_s
      type_string = file_string.split('.')[1]
      File.join('images/icons', type_string , "#{size}.png")
    end

  end
end
