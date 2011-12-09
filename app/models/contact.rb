class Contact < ActiveRecord::Base
  belongs_to :institution
  
  has_many :emails, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy

  has_attached_file :photo

  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
  
  validates_presence_of :name
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/gif'], :message => 'Permitidos apenas arquivos: .jpg, .gif e .png'

  def emails_as_html
    html = ''
    self.emails.each do |e|
      address = e.address.downcase
      html << "#{address}</br>"
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

end
