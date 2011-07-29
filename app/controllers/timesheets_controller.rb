class TimesheetsController < ApplicationController

  before_filter :login_required
  access_control [:list, :details, :new, :create, :edit, :update] => "( registrant | scheduler | organization )",
    :delete => "( organization | scheduler )"

  def list
    set_active_tab("timecards")
    if current_user.is_registrant?
      @timesheets = current_user.timesheets_of
    else
      @timesheets = Timesheet.all
    end
  end

  def details
    set_active_tab("timecards")
    @timesheet = Timesheet.find_by_id(params[:id])
  end
  
  def new
    set_active_tab("timecards")
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
    set_active_tab("timecards")
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
      @sunday = TimesheetEntry.new
      @monday = TimesheetEntry.new
      @teusday = TimesheetEntry.new
      @wednesday = TimesheetEntry.new
      @thursday = TimesheetEntry.new
      @friday = TimesheetEntry.new
      @saturday = TimesheetEntry.new
      render :action => :new
    end
  end

  def edit
    set_active_tab("timecards")
    @timesheet = Timesheet.find_by_id(params[:id])
    @sunday = @timesheet.timesheet_entries.detect{|e| e.day == "sunday"}
    @monday = @timesheet.timesheet_entries.detect{|e| e.day == "monday"}
    @teusday = @timesheet.timesheet_entries.detect{|e| e.day == "teusday"}
    @wednesday = @timesheet.timesheet_entries.detect{|e| e.day == "wednesday"}
    @thursday = @timesheet.timesheet_entries.detect{|e| e.day == "thursday"}
    @friday = @timesheet.timesheet_entries.detect{|e| e.day == "friday"}
    @saturday = @timesheet.timesheet_entries.detect{|e| e.day == "saturday"}
  end

  def update_sheet
    set_active_tab("timecards")
    @timesheet = Timesheet.find_by_id(params[:id])
    @timesheet.creator = current_user
    @timesheet.client = User.find_by_id(params[:client_id])
    @timesheet.registrant = User.find_by_id(params[:registrant_id])
    if @timesheet.update_attributes(params[:timesheet])
      params[:images].each{ |image| @timesheet.timesheet_images.create!(:image => image ) } if params[:images].present?
      @sunday = @timesheet.timesheet_entries.detect{|e| e.day == "sunday"}
      @sunday.update_attributes(params[:sunday])
      @monday = @timesheet.timesheet_entries.detect{|e| e.day == "monday"}
      @monday.update_attributes(params[:monday])
      @teusday = @timesheet.timesheet_entries.detect{|e| e.day == "teusday"}
      @teusday.update_attributes(params[:teusday])
      @wednesday = @timesheet.timesheet_entries.detect{|e| e.day == "wednesday"}
      @wednesday.update_attributes(params[:wednesday])
      @thursday = @timesheet.timesheet_entries.detect{|e| e.day == "thursday"}
      @thursday.update_attributes(params[:thursday])
      @friday = @timesheet.timesheet_entries.detect{|e| e.day == "friday"}
      @friday.update_attributes(params[:friday])
      @saturday = @timesheet.timesheet_entries.detect{|e| e.day == "saturday"}
      @saturday.update_attributes(params[:saturday])
      flash[:notice] = "Timesheet was updated."
      redirect_to :action => :list
    else
      flash[:notice] = "Timesheet was not updated."
      @sunday = @timesheet.timesheet_entries.detect{|e| e.day == "sunday"}
      @monday = @timesheet.timesheet_entries.detect{|e| e.day == "monday"}
      @teusday = @timesheet.timesheet_entries.detect{|e| e.day == "teusday"}
      @wednesday = @timesheet.timesheet_entries.detect{|e| e.day == "wednesday"}
      @thursday = @timesheet.timesheet_entries.detect{|e| e.day == "thursday"}
      @friday = @timesheet.timesheet_entries.detect{|e| e.day == "friday"}
      @saturday = @timesheet.timesheet_entries.detect{|e| e.day == "saturday"}
      render :action => :new
    end
  end

  def delete
    set_active_tab("timecards")
    @timesheet = Timesheet.find_by_id(params[:id])
    @timesheet.destroy
    flash[:notice]  = "Timesheet was deleted."
    redirect_to :action => :list
  end

end
