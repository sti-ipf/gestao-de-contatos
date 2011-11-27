class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  acts_as_authentic
end
