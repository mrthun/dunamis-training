class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  before_filter :login_required, :only => [:new_employee, :create_employee]
  access_control [:new_employee,:create_employee]  => 'organization'

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.roles << Role.find_by_title(params[:role])
    if params[:role] == 'registrant'
      @organization = User.find_by_id(params[:organization_id])
      @user.organization_id = @organization.id
      @user.organization_type = @organization.class.name
      @user.status_id = Status.find_by_title("not_activated").id
    elsif params[:role] == 'organization'
      @user.status_id = Status.find_by_title("on_hold").id
      @user.subdomain = Subdomain.new :name => params[:user][:name].downcase
    end
    success = @user && @user.save

    if success && @user.errors.empty?
      if params[:asset].present?
        @asset = Asset.new(:asset => params[:asset])
        @asset.user = @user
        @asset.asset_asset_type = "#{params[:key]}"
        @asset.save
      end
      redirect_back_or_default('/', :notice => "Thanks for signing up!  We're sending you an email with your activation code.")
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      redirect_to '/', :notice => "Signup complete! Please sign in to continue."
    when params[:activation_code].blank?
      redirect_back_or_default('/', :flash => { :error => "The activation code was missing.  Please follow the URL from your email." })
    else 
      redirect_back_or_default('/', :flash => { :error  => "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in." })
    end
  end

  def list_employees
    @employees = User.employees
  end

  def new_employee
    @user = User.new
    @roles = Role.all.select{ |role| role.title == "scheduler" || role.title == "registrant" }
  end

  def create_employee
    @user = User.new(params[:user])
    @user.roles << Role.find_by_id(params[:role_id])
    success = @user && @user.save
    @roles = Role.all.select{ |role| role.title == "scheduler" || role.title == "registrant" }
    if success && @user.errors.empty?
      flash[:notice] = "An email has been sent to the created emplyee with activation information."
      redirect_to :action => :list_employees
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new_employee'
    end
  end

  def change_status
    @employee = User.find_by_id(params[:id])
    @employee.activate!
    flash[:notice] = "Employee was activated."
    redirect_to :action => :list_employees
  end

  def delete_employee
    @employee = User.find_by_id(params[:id])
    @employee.destroy
    flash[:notice] = "Employee was removed."
    redirect_to :action => :list_employees
  end

end
