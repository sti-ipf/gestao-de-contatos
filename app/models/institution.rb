class Institution < ActiveRecord::Base
  has_many :emails, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy
  has_many :contacts, :dependent => :destroy

  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true

  validates_presence_of :name
  validate :site, :site_is_valid

  before_save :parse_site

  def emails_as_html
    html = ''
    self.emails.each do |e|
      html << "#{e.address}</br>"
    end
    html
  end

  def phones_as_html
    html = ''
    self.phones.each do |p|
      html << "#{p.number}</br>"
    end
    html
  end

protected

  def site_is_valid
    if !self.site.blank?
      if !IPF::Util.link_is_a_valid_url?(self.site)
        self.errors.add_to_base('Site inválido')
      end
    end
  end
  
  def parse_site
    if !self.site.include?('http')
      self.site = "http://#{self.site}"
    end
  end
  
end
