Rails.application.routes.draw do
  get 'user/show'
  namespace :api do
    resources :games
    resources :game_events, only: %i[create]
    get 'user', to: 'users#show', as: 'user'
  end

  devise_for :users, path: 'api', path_names: {
                                    sign_in: 'sessions',
                                    sign_out: 'sessions',
                                    registration: 'user'
                                  },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
end
