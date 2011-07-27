class TimesheetsController < ApplicationController

  before_filter :login_required

  def list
    if current_user.is_registrant?
      @timesheets = current_user.timesheets_of
    else
      @timesheets = Timesheet.all
    end
  end

  def details
    @timesheet = Timesheet.find_by_id(params[:id])
  end
  
  def new
    @timesheet = Timesheet.new
    @sunday = TimesheetEntry.new
    @monday = TimesheetEntry.new
    @teusday = TimesheetEntry.new
    @wednesday = TimesheetEntry.new
    @thursday = TimesheetEntry.new
    @friday = TimesheetEntry.new
    @saturday = TimesheetEntry.new
  end


  def create
    @timesheet = Timesheet.new(params[:timesheet])
    @timesheet.creator = current_user
    @timesheet.client = User.find_by_id(params[:client_id])
    @timesheet.registrant = User.find_by_id(params[:registrant_id])
    if @timesheet.save
      params[:images].each{ |image| @timesheet.timesheet_images.create!(:image => image ) } if params[:images].present?
      @timesheet.timesheet_entries.create!(params[:sunday])
      @timesheet.timesheet_entries.create!(params[:monday])
      @timesheet.timesheet_entries.create!(params[:teusday])
      @timesheet.timesheet_entries.create!(params[:wednesday])
      @timesheet.timesheet_entries.create!(params[:thursday])
      @timesheet.timesheet_entries.create!(params[:friday])
      @timesheet.timesheet_entries.create!(params[:saturday])
      flash[:notice] = "Timesheet was created."
      redirect_to :action => :list
    else
      flash[:notice] = "Timesheet was not created."
      render :action => :new
    end
  end

  def edit

  end

  def update

  end

  def delete
    @timesheet = Timesheet.find_by_id(params[:id])
    @timesheet.destroy
    flash[:notice]  = "Timesheet was deleted."
    redirect_to :action => :list
  end

end
