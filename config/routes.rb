Rails.application.routes.draw do
  get 'user_journal', to: 'journals#user_journal'
  get 'search_journal', to: 'journals#search_journal'
  resources :journals
  get 'dev/home'
  get 'dev/pns'
  get 'dev/roa'
  get 'lawsuits/scrapers/sbn', to: 'scrapers#sbn'
  get 'bar', to: 'scrapers#bar'
  get 'scrapers/roa'
  get 'scrapers/pns'
  get 'scrapers/ncf'
  get 'scrapers/tr'
  get 'initiate_nc/intake', to: 'initiate_nc#intake'
  get 'letters/rpf'
  get 'letters/edd'
  get 'letters/letterhead'
  get 'pnc', to: 'initiate_nc#pnc'
  get 'initiate_nc/retainer', to: 'initiate_nc#retainer'
  get 'initiate_nc/auth', to: 'initiate_nc#auth'
  resources :clients
  resources :responses
  get 'lawandmotions/separate_statement'
  get 'lawandmotions/proposed_order'
  get 'lawandmotions/notice_of_motion'
  get 'lawandmotions/memo_panda'
  get 'lawandmotions/declaration'

  get 'discoveries/generate_disco', to: 'discoveries#generate_disco'
 
  get 'depositions/generate_depo', to: 'depositions#generate_depo'
  get 'depositions/generate_depo_objections', to: 'depositions#generate_depo_objections'

  get 'lcourtdates/edit', to: 'lcourtdates#edit'

  get 'courtdates/zedit', to: 'courtdates#zedit'

  get 'jcfs/pes'
  get 'jcfs/ex_parte'
  get 'jcfs/cms'
  get 'jcfs/frog_e'
  get 'jcfs/frog_g'
  get 'jcfs/peremptory_challenge'
  get 'jcfs/decl'
  get 'jcfs/attachment'
  get 'jcfs/amendment_to_complaint'
  get 'jcfs/rfa'
  get 'jcfs/req_entry_of_default'
  get 'jcfs/electronic_service'
  get 'jcfs/electronic_documents'
  get 'jcfs/electronic_persons'

  get 'responses/g_response'

  get 'ocs/envelope'
  get 'ocs/attyenvelope'
  get 'ocs/attycorres'
  
  get 'pleadings/generic'
  get 'pleadings/memo_panda'
  get 'pleadings/notice_of_motion'
  get 'pleadings/atty_decl'
  get 'pleadings/test'
  
  get 'discoveries/initial_disclosures', to: 'discoveries#initial_disclosures'
  get 'discoveries/rfp', to: 'discoveries#rfp'

  resources :courtdates
  root 'users#portfolio'
  get 'users/clients_portfolio'
  resources :user_lawsuits
  resources :user_clients
  get 'admin/home'
 
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  get 'users/remove', to: 'users#remove'
  get 'users/remove_client', to: 'users#remove_client'

  get 'pages/pns', to: 'pages#pns'
  get 'pns_search', to: 'dev#pns_search'

  get 'roa_search', to: 'dev#roa_search'

  get 'letters/pfr'
  get '/employer', to: 'letters#employer'

  resources :discoveries
  resources :depositions
  resources :lawsuits
  resources :participants
  resources :ocs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
