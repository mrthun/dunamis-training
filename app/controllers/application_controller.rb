class ApplicationController < ActionController::Base
  include UrlHelper
  include AuthenticatedSystem
  protect_from_forgery
  before_filter :set_organization
  before_filter :set_mailer_url_options

  protected

  def set_organization
    if is_subdomian?(request.subdomain)
      @organization = User.find_by_name(request.subdomain)
      unless @organization.present?
        return render :template => '/shared/404'
      end
    end
  end
  
  def is_subdomian?(subdomain)
    subdomain.present? && subdomain != "www"
  end

  def permission_denied
    flash[:notice] = "You don't have privileges to access this action"
    return render :template => '/shared/403'
  end
    
end
