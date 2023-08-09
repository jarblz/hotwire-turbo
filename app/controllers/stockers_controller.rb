# frozen_string_literal: true

# some controller
class StockersController < ApplicationController
  def index
    @stocker = Stocker.new
  end

  def task_params
    params.require(:stocker).permit(:latitude, :longitude)
  end
end
