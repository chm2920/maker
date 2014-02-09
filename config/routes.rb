Maker::Application.routes.draw do
  
  get "(:id).html" => "start#show"
  get "tag/:id" => "start#tag"
  get "catalog/:id" => "start#catalog"

  get "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  post "admin_login_rst" => "account#login_rst"
  get "admin_logout" => "account#logout"
  
  namespace :admin do
    resources :catalogs do
      collection do
        post :batch_update
      end
    end
    
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
    
    resources :tags
        
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
  
  get "upload_asset" => "assets#create"
  get "file_manager_json" => "assets#list"
      
  root :to => 'start#index'
  
  get "*path" => "application#render_not_found"
  
end
