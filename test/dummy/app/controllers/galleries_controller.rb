class GalleriesController < ApplicationController
  cruddler :all,
    :class => Gallery,
    path_components: [],
    parameter_name: 'gallery'
end
