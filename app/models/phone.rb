class Phone < ActiveRecord::Base
  belongs_to :institution
  belongs_to :contact

  TYPES_FOR_INSTITUTION = [['Comercial', 1], ['Celular', 2]]
  TYPES_FOR_CONTACT = [['Residencial', 3],['Comercial', 1], ['Celular', 2]]
end
