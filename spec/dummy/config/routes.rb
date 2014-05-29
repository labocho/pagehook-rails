Rails.application.routes.draw do

  resources :articles


  mount PagehookRails::Engine => "/pagehook-rails"
end
