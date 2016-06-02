# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

City.create([
  { name: 'Burlington, VT', country: 'USA' },
  { name: 'Johnson, VT', country: 'USA' },
  { name: 'Toronto', country: 'Canada' },
  { name: 'San Francisco, CA', country: 'USA' },
  { name: 'Seattle, WA', country: 'USA' },
  { name: 'Vancouver', country: 'Canada' },
])
