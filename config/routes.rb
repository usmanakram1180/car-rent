Rails.application.routes.draw do
  mount Motor::Admin => '/motor_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get '/home', to: "homes#index"
get '/about', to: "abouts#index"
get '/service', to: "services#index"
get '/blog', to: "blogs#index"
get '/feature', to: "features#index"
get '/car', to: "cars#index"
get '/team', to: "teams#index"
get '/testimonial', to: "testimonials#index"
get '/contact', to: "contacts#index"
resource :home
resources :bookings
resource :about
resource :service
resource :blog
resource :feature
resources :cars
resource :team
resource :testimonial
resource :contact
resources :subscriptions, only: [:create]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "homes#index"
end
