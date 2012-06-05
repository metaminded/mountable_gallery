class MmGallery::ImageArtifactsController < MmGallery::ApplicationController
  cruddler :all,
    :class => MmGallery::ImageArtifact,
    path_components: [],
    parameter_name: 'image_artifact'

end
