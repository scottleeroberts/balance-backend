Rails.application.routes.draw do
  namespace :api do
    resources :games
    resources :game_events, only: %i[create]
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
