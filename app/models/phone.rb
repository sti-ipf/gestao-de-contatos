class Phone < ActiveRecord::Base
  belongs_to :institution
  belongs_to :contact

  validates_size_of :number, :minimum => 12

  TYPES_FOR_INSTITUTION = [['Comercial', 1], ['Celular', 2], ['Fax', 4]]
  TYPES_FOR_CONTACT = [['Residencial', 3],['Comercial', 1], ['Celular', 2]]
end
