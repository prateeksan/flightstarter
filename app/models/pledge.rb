# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
end
