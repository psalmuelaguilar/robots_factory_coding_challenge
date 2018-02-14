Rails.application.routes.draw do
  resources :robots, only: %i(index) do
    member do
      put :extinguish
    end

    collection do
      put :recycle
    end
  end

  resources :shipments, only: %i(create)
end
