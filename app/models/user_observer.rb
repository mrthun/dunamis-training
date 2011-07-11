class UserObserver < ActiveRecord::Observer

  def after_create(user)
    return if user.skip_activation
    UserMailer.signup_notification(user).deliver
  end

  def after_save(user)
    return if user.skip_activation
    UserMailer.activation(user).deliver if user.recently_activated?
  end

end
