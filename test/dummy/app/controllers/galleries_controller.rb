class GalleriesController < ApplicationController
  cruddler :all,
    :klass => Gallery,
    path_components: [],
    parameter_name: 'gallery' do
    params.require(:gallery).permit(*Gallery.permitted_attributes)
  end

  def index
    tabulatr_for Gallery.all
  end
end
