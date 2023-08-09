# frozen_string_literal: true

# some controller
class StockersController < ApplicationController
  def index
    @stocker = Stocker.new
    # @task = Task.new
    # if params[:query].present?
    #   @tasks = Task.where('description LIKE ?', "%#{params[:query]}%")
    # else
    #   @tasks = Task.all
    # end
    # if turbo_frame_request?
    #   render partial: 'tasks', locals: { tasks: @tasks }
    # else
    #   render :index
    # end
  end

  def task_params
    params.require(:stocker).permit(:latitude, :longitude)
  end
end
