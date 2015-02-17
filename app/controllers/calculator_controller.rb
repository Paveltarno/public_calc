class CalculatorController < ApplicationController

  CURRENT_VALUE_KEY = "calc_current_value"

  def show
  end

  #
  # Stores the new value in the DB
  # then notifies the messaging server
  #
  # 
  def perform_action
    binding.pry
    # Store the new value in redis
    $redis.set(CURRENT_VALUE_KEY, params)

  end

  #
  # The callback function JS clients query
  # to get the current calculator value
  #
  # 
  def screen_changed
  end

end

