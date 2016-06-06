# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :legs
  validates :title, length: { minimum: 2 }
end
