class MountableGallery::ImageArtifactsController < MountableGallery::ApplicationController
  cruddler :all,
    :class => MountableGallery::ImageArtifact,
    path_components: [],
    parameter_name: 'image_artifact'

end
