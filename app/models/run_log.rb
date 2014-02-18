class RunLog < ActiveRecord::Base
  
  def self.log_info(params, request, e)
    params.permit!
    self.create(:log_path => params[:controller] + "/" + params[:action],
      :log_method => request.method,
      :log_params => params.to_s,
      :log_exception => e.to_s,
      :log_remote_ip => request.remote_ip
    )
  end
  
end
