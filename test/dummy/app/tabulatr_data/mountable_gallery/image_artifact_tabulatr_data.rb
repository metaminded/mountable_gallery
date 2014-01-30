class MountableGallery::ImageArtifactTabulatrData < Tabulatr::Data
  column :id
  column :title
  column :actions do |r|
  [
    link_to("Show", image_artifact_path(r)),
    link_to("Edit", edit_image_artifact_path(r), id: "edit_image_artifact_#{r.id}"),
    link_to("Destroy", image_artifact_path(r), method: 'destroy')
  ]
  end
end
