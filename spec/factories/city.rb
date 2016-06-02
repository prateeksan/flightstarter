# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

FactoryGirl.define do
  factory :city do
    sequence(:name) {|n| "City #{n}" }
  end
end
