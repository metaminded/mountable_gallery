MountableGallery::Engine.routes.draw do

  resources :image_artifacts
  resources :galleries
  resources :artifacts, only: [:index, :show]
end
