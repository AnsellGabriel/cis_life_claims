Rails.application.routes.draw do
  resources :claim_routes
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :users
  resources :authority_levels
  resources :branches
  resources :claim_documents
  resources :documents
  resources :statuses
  resources :claim_remarks
  resources :claim_causes
  resources :claim_confinements
  resources :claim_distributions
  resources :claim_beneficiaries
  resources :claim_coverages
  resources :claim_benefits
  resources :process_claims do 
    get "process", to: "process_claims#process", on: :member
    get "evaluate", to: "process_claims#evaluate", on: :member
    get "reconsider", to: "process_claims#reconsider", on: :member
    get "route", to: "process_claims#claim_route", on: :member
    get "change_status", to: "process_claims#change_status", on: :member
    get "index_evalutate", to: "process_claims#index_evaluate", as: "view_evaluate", on: :collection
    get "index_reconsider", to: "process_claims#index_reconsider", as: "view_reconsider", on: :collection
  end
  resources :requirements
  resources :coop_branches
  resources :plans
  resources :geo_barangays
  resources :geo_municipalities do
    get :selected, on: :member
  end
  resources :geo_provinces  do
    get :selected, on: :member
  end
  resources :geo_regions  do
    get :selected, on: :member
  end
  resources :cooperatives  do
    get :selected, on: :member
  end
  resources :agents
  resources :benefits
  resources :causes
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
   root "pages#home"
end
