class ImageArtifactsController < ApplicationController
  cruddler :all,
    :klass => MountableGallery::ImageArtifact,
    path_components: [],
    parameter_name: 'image_artifact' do
    params.require(:image_artifact).permit(*MountableGallery::ImageArtifact.permitted_attributes)
  end
  def index
    tabulatr_for MountableGallery::ImageArtifact.all
  end
end
