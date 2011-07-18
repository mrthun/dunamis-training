class ApplicationController < ActionController::Base
  include UrlHelper
  include AuthenticatedSystem
  protect_from_forgery
  #before_filter :limit_subdomain_access
  before_filter :set_mailer_url_options

  protected

  def limit_subdomain_access
    if request.subdomain.present?
      # this error handling could be more sophisticated!
      # please make a suggestion :-)
      redirect_to root_url(:subdomain => false)
    end
  end
  protected

  def permission_denied
    flash[:notice] = "You don't have privileges to access this action"
    return render :template => '/shared/403'
  end
    
end
