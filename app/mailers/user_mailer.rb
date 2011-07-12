class UserMailer < ActionMailer::Base

  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @url  = "http://#{@host}/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @url  = "http://#{@user.subdomain.name}.#{@host}/"
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
