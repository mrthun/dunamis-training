class HomeController < ApplicationController

  before_filter :login_required, :except => [:index, :routing]
  access_control [:configurations,
    :occupations, :add_occupation, :remove_occupation,
    :contracts, :add_contract, :remove_contratc,
    :facilities, :add_facility, :remove_facility,
    :pays, :add_pay, :remove_payg] => 'organization'

  def index
    set_active_tab("home")
  end

  def configurations
    set_active_tab("configurations")
  end

  def occupations
    set_active_tab("configurations")
    @occupations = OccupationType.all
    @occupation_type = OccupationType.new
  end

  def add_occupation
    set_active_tab("configurations")
    @occupation_type = OccupationType.new(params[:occupation_type])
    if @occupation_type.save
      flash[:notice] = "New Occupation type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :occupations
  end

  def remove_occupation
    set_active_tab("configurations")
    @occupation_type = OccupationType.find_by_id(params[:id])
    if @occupation_type.destroy
      flash[:notice] = "Occupation type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :occupations
  end

  def contracts
    set_active_tab("configurations")
    @contracts = ContractType.all
    @contract_type = ContractType.new
  end

  def add_contract
    set_active_tab("configurations")
    @contract_type = ContractType.new(params[:contract_type])
    if @contract_type.save
      flash[:notice] = "New contract type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :contracts
  end

  def remove_contract
    set_active_tab("configurations")
    @contract_type = ContractType.find_by_id(params[:id])
    if @contract_type.destroy
      flash[:notice] = "Contract type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :contracts
  end

  def facilities
    set_active_tab("configurations")
    @facilities = FacilityType.all
    @facility_type = FacilityType.new
  end

  def add_facility
    set_active_tab("configurations")
    @facility_type = FacilityType.new(params[:facility_type])
    if @facility_type.save
      flash[:notice] = "New facility type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :facilities
  end

  def remove_facility
    set_active_tab("configurations")
    @facility_type = FacilityType.find_by_id(params[:id])
    if @facility_type.destroy
      flash[:notice] = "Facility type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :facilities
  end

  def pays
    set_active_tab("configurations")
    @pays = PayType.all
    @pay_type = PayType.new
  end

  def add_pay
    set_active_tab("configurations")
    @pay_type = PayType.new(params[:pay_type])
    if @pay_type.save
      flash[:notice] = "New pay type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :pays
  end

  def remove_pay
    set_active_tab("configurations")
    @pay_type = PayType.find_by_id(params[:id])
    if @pay_type.destroy
      flash[:notice] = "Pay type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :pays
  end

  def routing
    set_active_tab("home")
    render :template => "/shared/404.html"
  end

end
