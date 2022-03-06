class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to performances_path, notice: "Performance created!"
    else
      render :new
    end
  end

  def destroy
    Performance.find(params[:id]).destroy
    redirect_to performances_url
  end

  private

  def performance_params
    params.require(:performance).permit(:title, show_dates: [:start_date, :end_date])
  end
end
