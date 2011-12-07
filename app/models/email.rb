class Email < ActiveRecord::Base
  belongs_to :contact
  belongs_to :institution

  validate :address, :email_is_valid

private

  def email_is_valid
    if !self.address.blank?
      regex = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
      if !(self.address =~ regex)
         self.errors.add(:address, 'E-mail inválido')
      end
    end
  end
end
