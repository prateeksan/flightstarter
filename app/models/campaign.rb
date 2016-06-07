# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :legs
  validates :title, length: { minimum: 2 }
  validates :user, presence: true
  validate :title_contains_non_digits

  private
    def title_contains_non_digits
      if title =~ /^[0-9]*+$/
        errors.add(:title, 'Must contain non-digit characters.')
      end
    end
end
