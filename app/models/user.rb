class User < ActiveRecord::Base
  has_secure_password
  belongs_to :city
  belongs_to :location
end
