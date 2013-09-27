Maker::Application.routes.draw do
  
  match "catalog/:id" => "start#catalog"
  match "news/:id" => "start#show"

  match "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  match "admin_login_rst" => "account#login_rst"
  match "admin_logout" => "account#logout"
  
  namespace :admin do
    resources :catalogs
    
    get "topics/clear"
    delete "topics/del"
    post "topics/repost"
    get "topics/trashes"
    post "topics/trashes"
    resources :topics do
      collection do
        get :index
      end
    end
        
    get "db/index"
    
    post "db/backup"
    post "db/restore"
    delete "db/destroy"
    
    get "db/sql"
    post "db/sql"
    
    get "db/tables"
    get "db/structure"
    post "db/export_sql"
        
    resources :friendlinks do
      collection do
        post :batch_update
      end
    end
      
    get "run_logs/index"
    post "run_logs/index"
    get "run_logs/clear"
    resources :run_logs
    
    resources :admins
  end
  
  namespace :kindeditor do
    post "/upload" => "assets#create"
    get  "/filemanager" => "assets#list"
  end
  
  match "upload_asset" => "assets#create"
  match "file_manager_json" => "assets#list"
      
  root :to => 'start#index'
  
  match "*path" => "application#render_not_found"
  
end
