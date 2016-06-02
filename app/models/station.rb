# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Station < ActiveRecord::Base
  belongs_to :location
end
