class MmGallery::GalleriesController < MmGallery::ApplicationController
  cruddler :all,
    :class => MmGallery::Gallery,
    path_components: [],
    parameter_name: 'gallery'
end
