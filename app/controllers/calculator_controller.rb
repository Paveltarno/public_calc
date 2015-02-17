class CalculatorController < ApplicationController

  CURRENT_VALUE_KEY = "calc_current_value"

  def show
    @curr_value = $redis.get(CURRENT_VALUE_KEY)
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

end

