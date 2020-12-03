class SevensController < ApplicationController
  def index
  end

  def new
    @seven = Seven.new
  end

  def create
    @seven = Seven.new(seven_params)
    if @seven.save
      redirect_to seven_path(@seven.id)
    else
      render :new
    end
  end

  def show
    @seven = Seven.find(params[:id])
  end

  def judgment
  end

  def ninety
  end

  def sixty
  end

  def thirty
  end

  def ten
  end

  private

  def seven_params
    params.require(:seven).permit(:principal, :deposit, :annual_yield_id, :years_id)
  end

end
