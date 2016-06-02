# Copyright 2016 Prateek Sanyal and Steven Dee.
# All rights reserved.

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
