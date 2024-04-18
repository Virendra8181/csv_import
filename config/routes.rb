Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :crime_reports do
    collection do
      post 'import_data', to: 'crime_reports#import_data'
      post 'crime_report_values',to: 'crime_reports#crime_report_values'
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
