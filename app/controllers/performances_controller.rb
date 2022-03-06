class PerformancesController < ApplicationController
  def index
    @performances = Performance.all
  end

  def new
    @performance = Performance.new
  end

  def show
  end

  def create
    if Performance.new(performance_params).save
      redirect_to performances_path, notice: "Performance created!"
    else
      render :new
    end
  end

  def destroy
    performance.destroy
    redirect_to performances_url, notice: "Performance deleted!"
  end

  private

  def performance_params
    params.require(:performance).permit(:title, :show_dates)
  end

  def performance
    @performance ||= Performance.find(params[:id])
  end
end
