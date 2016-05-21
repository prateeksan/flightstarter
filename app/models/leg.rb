class Leg < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :startpoint, class_name: 'Location'
  belongs_to :endpoint, class_name: 'Location'
end
