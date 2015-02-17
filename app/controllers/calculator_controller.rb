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

    # Store the new value in redis
    $redis.set(CURRENT_VALUE_KEY, params["calc_value"])
    @message = (params["calc_value"])
  end

  #
  # The callback function JS clients query
  # to get the current calculator value
  #
  # 
  def screen_changed
  end

end

