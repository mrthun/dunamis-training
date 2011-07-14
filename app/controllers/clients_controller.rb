class ClientsController < ApplicationController
  before_filter :login_required
  access_control :DEFAULT => 'scheduler'

  def list
    @clients = User.clients
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.roles << Role.find_by_title("client")
    success = @user && @user.save

    if success && @user.errors.empty?
      flash[:notice] = "A New Client has been created"
      redirect_to :action => :show, :c_id => @user.id
    else
      flash.now[:error]  = "We couldn't set up that account, sorry.  Please try again."
      render :action => 'new'
    end
  end

  def show
    @client = User.find_by_id(params[:c_id])
    if request.xhr? && params[:link].present?
      case params[:link]
      when "basic_data"
        @resource = @client.basic_data.present? ? @client.basic_data : BasicData.new
      when "addresses"
        @resource = @client.address.present? ? @client.address : Address.new
      when "billing"
        @resource = @client.billing_data.present? ? @client.billing_data : BillingData.new
      when "locations"
        @resource = @client.client_locations.present? ? @client.client_locations.first : ClientLocation.new
      end
      render :json => {:success => true, :html => render_to_string(:partial => "/clients/client.html") }.to_json
    else
      @resource = @client.basic_data.present? ? @client.basic_data : BasicData.new
    end
  end

  def create_basic_data

  end

  def create_addresses

  end

  def create_billing

  end

  def create_locations

  end

end
