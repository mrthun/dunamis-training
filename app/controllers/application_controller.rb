class ApplicationController < ActionController::Base
  include UrlHelper
  include AuthenticatedSystem
  protect_from_forgery
  before_filter :set_organization_subdomain
  before_filter :set_mailer_url_options

  protected

  def set_organization_subdomain
    if is_subdomian?(request.subdomain)
      if logged_in? && current_user.is_admin?
        redirect_to(request.protocol + request.domain + (request.port.nil? ? '' : ":#{request.port}")+ request.request_uri)
      else
        @organization = User.find_by_name(request.subdomain)
        unless @organization.present?
          return render :template => '/shared/404'
        end
        @subdomain = @organization.subdomain.name
      end
    elsif logged_in? && current_user.is_organization?
      redirect_to(request.protocol + "#{current_user.subdomain.name}." +request.domain + (request.port.nil? ? '' : ":#{request.port}") + request.request_uri)
    else
      @subdomain = false
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
