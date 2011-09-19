class Email < ActiveRecord::Base
  belongs_to :contact
  belongs_to :institution
end
