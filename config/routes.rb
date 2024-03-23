Rails.application.routes.draw do
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
