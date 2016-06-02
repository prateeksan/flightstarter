# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Campaign < ActiveRecord::Base
  validates :title, length: { minimum: 2 }
  has_many :legs
end
