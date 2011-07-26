require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken


  set_table_name 'users'

  #  validates :login, :presence   => true,
  #                    :uniqueness => true,
  #                    :length     => { :within => 3..40 },
  #                    :format     => { :with => Authentication.login_regex, :message => Authentication.bad_login_message }
  #
  validates :name,  :format     => { :with => Authentication.name_regex, :message => Authentication.bad_name_message },
    :length     => { :maximum => 100 },
    :allow_nil  => true,
    :uniqueness => true

  validates :email, :presence   => true,
    :uniqueness => true,
    :format     => { :with => Authentication.email_regex, :message => Authentication.bad_email_message },
    :length     => { :within => 6..100 }

  before_create :make_activation_code

  has_one :subdomain, :dependent => :destroy
  has_and_belongs_to_many :roles
  has_one :personal_data, :as => :registrant, :dependent => :destroy
  has_one :skill, :as => :registrant, :dependent => :destroy
  has_many :work_locations, :as => :registrant, :dependent => :destroy
  has_one :preference, :as => :registrant, :dependent => :destroy
  has_one :pay, :as => :registrant, :dependent => :destroy
  has_one :credential, :as => :registrant, :dependent => :destroy
  has_many :assets, :dependent => :destroy

  has_one :basic_data, :as => :client, :dependent => :destroy
  has_one :address, :as => :client, :dependent => :destroy
  has_one :billing_data, :as => :client, :dependent => :destroy
  has_many :client_locations, :as => :client, :dependent => :destroy
  has_many :employees, :as => :organization, :class_name => "User", :dependent => :destroy
  has_many :created_jobs, :as => :creator, :class_name => "Job", :dependent => :destroy
  has_many :requested_jobs, :as => :client, :class_name => "Job", :dependent => :destroy
  has_many :assigned_jobs, :as => :registrant, :class_name => "Job", :dependent => :destroy

  has_one :profile_data, :as => :scheduler, :dependent => :destroy

  belongs_to :status
  belongs_to :organization, :polymorphic => true

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :name, :email,:password, :password_confirmation, :status_id, :organization_id, :organization_type

  attr_accessor_with_default :skip_activation, false

  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    self.status_id = self.is_organization? ? Status.find_by_title("active").id : Status.find_by_title("missing_data").id unless self.is_admin?
    save(:validate => false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  def is_active?
    status.title.eql?("active")
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    u = where(['email = ? and activated_at IS NOT NULL', email]).first # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def name=(value)
    write_attribute :name, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  def is_admin?
    roles.include? Role.find_by_title "admin"
  end

  def is_organization?
    roles.include? Role.find_by_title "organization"
  end

  def is_registrant?
    roles.include? Role.find_by_title "registrant"
  end

  def is_scheduler?
    roles.include? Role.find_by_title "scheduler"
  end

  def is_client?
    roles.include? Role.find_by_title "client"
  end

  def has_asset?(name)
    asset(name)
  end

  def remove_asset(name)
    asset =  asset(name)
    asset.destroy if asset.present?
  end

  def asset(name)
    assets.find_by_asset_asset_type(name) if assets.present?
  end

  def registrants
    employees.select{ |user| user.is_registrant? && user.active? }
  end

  def schedulers
    employees.select{ |user| user.is_scheduler? && user.active? }
  end

  def clients
    employees.select{ |user| user.is_client? && user.active? }
  end

  def filter_registrants(service, location)
    registrants = self.registrants.select do |r|
      r.status.title == "active" && r.skill.occupation_type.title.include?("#{service.downcase}") && @loc = r.work_locations.detect{|loc| loc.name.include?("#{location.downcase}") && loc.do_not_schedule == false }
    end
    return { :registrants => registrants, :service => registrants.first.skill.occupation_type.title, :location => @loc.name }
  end

  def self.employees
    all.select{ |user| user.is_registrant? || user.is_scheduler? }
  end
  
  def self.clients
    all.select{ |user| user.is_client? && user.active? }
  end

  def self.organizations
    all.select{ |user| user.is_organization? }
  end
  
  def self.registrants
    all.select{ |user| user.is_registrant? && user.active? }
  end

  protected
    

  def make_activation_code
  
    self.activation_code = self.class.make_token
  end


end




# == Schema Information
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  name                      :string(100)
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  updated_at                :datetime
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  activation_code           :string(40)
#  activated_at              :datetime
#  status_id                 :integer(4)
#  organization_id           :integer(4)
#  organization_type         :string(255)
#

