Rails.application.routes.draw do
  resources :robots, only: %i(index) do
    member do
      put :extinguish
    end

    collection do
      post :recycle
    end
  end

  resources :shipments, only: %i(create)
end
