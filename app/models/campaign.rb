class Campaign < ActiveRecord::Base
  validates :title, length: { minimum: 2 }
  has_many :legs
end
