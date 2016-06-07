# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

FactoryGirl.define do
  factory :leg do
    campaign
    association :startpoint, factory: :city
    association :endpoint, factory: :city
  end
end
