# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.
#
# encoding: utf-8

class Leg < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :startpoint, class_name: 'City'
  belongs_to :endpoint, class_name: 'City'

  validates :campaign, presence: true

  def from_to
    if startpoint and endpoint
      "#{startpoint.name} → #{endpoint.name}"
    elsif endpoint
      "→ #{endpoint.name}"
    else
      startpoint &. name
    end
  end
end
