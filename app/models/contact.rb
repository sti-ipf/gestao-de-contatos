class Contact < ActiveRecord::Base
  belongs_to :institution
  
  has_many :emails, :dependent => :destroy
  has_many :addresses, :dependent => :destroy
  has_many :phones, :dependent => :destroy

  has_attached_file :photo

  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
  
end
