Rails.application.routes.draw do
  devise_for :users, path: 'api', path_names: {
                                    sign_in: 'sessions',
                                    sign_out: 'logout',
                                    registration: 'user'
                                  },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  get 'up' => 'rails/health#show', as: :rails_health_check
end
