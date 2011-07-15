class UserMailer < ActionMailer::Base

  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    url  = user.is_organization? ? "http://#{user.subdomain.name}.#{@host}/activate/#{user.activation_code}" : "http://#{@host}/activate/#{user.activation_code}"
    @url  = url
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    #subdomian = user.is_organization? ? user.subdomain.name : user.organization.subdomain.name
    @url  = "http://#{@host}/"
  end
  
  protected

  def setup_email(user)
    @host = default_url_options[:host]
    @recipients  = "#{user.email}"
    @from        = "admin@dunamis.com"
    @subject     = "[DUNAMIS]"
    @sent_on     = Time.now
    @user = user
  end

end
