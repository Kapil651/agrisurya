Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root to: "pages#home"

  get "about", to: "pages#about", as: :about
  get "services", to: "pages#services", as: :services
  get "testimonials", to: "pages#testimonials", as: :testimonials
  get "blog", to: "pages#blog", as: :agriculture_blog
  get "blog/detail", to: "pages#blog_details", as: :agriculture_blog_detail
  get "contact", to: "pages#contact", as: :contact
end
