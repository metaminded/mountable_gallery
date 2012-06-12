class MountableGallery::GalleriesController < MountableGallery::ApplicationController
  cruddler :all,
    :class => MountableGallery::Gallery,
    path_components: [],
    parameter_name: 'gallery'
end
