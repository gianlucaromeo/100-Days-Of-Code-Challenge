# Disable parameter wrapping for JSON.
#
# For example, on /user, instead of having this:
# {
#   "user": {
#     "name": "John Doe"
#   }
# }
# We want to have this:
# {
#   "name": "John Doe"
# }
#
# Be sure to restart your server when you modify this file.
# This file is used to disable the default Rails behavior of wrapping parameters in a key based on the controller's name.
# This is done to make it easier to work with JSON data in the frontend.

# ActiveSupport.on_load(:action_controller) do
#   wrap_parameters format: []
# end

# The above code is commented out because it is not working as expected.
# The below code is the correct code to disable parameter wrapping for JSON.

# Disable parameter wrapping for JSON.
# Be sure to restart your server when you modify this file.
# This file is used to disable the default Rails behavior of wrapping parameters in a key based on the controller's name.
# This is done to make it easier to work with JSON data in the frontend.
ActiveSupport.on_load(:action_controller) do
    wrap_parameters format: []
  end