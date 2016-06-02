# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Residence < ActiveRecord::Base
  belongs_to :location
end
