# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'home', to: 'home#index'
  namespace :api do
    namespace :v1 do
      devise_for :users, path: 'users', path_names: {
                                          sign_in: 'login',
                                          sign_out: 'logout',
                                          registration: 'signup'
                                        },
                         controllers: {
                           sessions: 'api/v1/users/sessions',
                           registrations: 'api/v1/users/registrations'
                         }
    end
  end
end
