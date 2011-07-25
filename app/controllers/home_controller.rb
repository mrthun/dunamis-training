class HomeController < ApplicationController

  before_filter :login_required, :except => :index
  access_control [:configurations,
    :occupations, :add_occupation, :remove_occupation,
    :contracts, :add_contract, :remove_contratc,
    :facilities, :add_facility, :remove_facility,
    :pays, :add_pay, :remove_payg] => 'admin'

  def index

  end

  def configurations
    
  end

  def occupations
    @occupations = OccupationType.all
    @occupation_type = OccupationType.new
  end

  def add_occupation
    @occupation_type = OccupationType.new(params[:occupation_type])
    if @occupation_type.save
      flash[:notice] = "New Occupation type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :occupations
  end

  def remove_occupation
    @occupation_type = OccupationType.find_by_id(params[:id])
    if @occupation_type.destroy
      flash[:notice] = "Occupation type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :occupations
  end

  def contracts
    @contracts = ContractType.all
    @contract_type = ContractType.new
  end

  def add_contract
    @contract_type = ContractType.new(params[:contract_type])
    if @contract_type.save
      flash[:notice] = "New contract type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :contracts
  end

  def remove_contract
    @contract_type = ContractType.find_by_id(params[:id])
    if @contract_type.destroy
      flash[:notice] = "Contract type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :contracts
  end

  def facilities
    @facilities = FacilityType.all
    @facility_type = FacilityType.new
  end

  def add_facility
    @facility_type = FacilityType.new(params[:facility_type])
    if @facility_type.save
      flash[:notice] = "New facility type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :facilities
  end

  def remove_facility
    @facility_type = FacilityType.find_by_id(params[:id])
    if @facility_type.destroy
      flash[:notice] = "Facility type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :facilities
  end

  def pays
    @pays = PayType.all
    @pay_type = PayType.new
  end

  def add_pay
    @pay_type = PayType.new(params[:pay_type])
    if @pay_type.save
      flash[:notice] = "New pay type was created."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :pays
  end

  def remove_pay
    @pay_type = PayType.find_by_id(params[:id])
    if @pay_type.destroy
      flash[:notice] = "Pay type was removed."
    else
      flash[:error] = "Sorry! Something went wrong. Please try again."
    end
    redirect_to :action => :pays
  end


end
