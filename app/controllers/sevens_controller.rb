class SevensController < ApplicationController
  def index
  end

  def new
    @seven = Seven.new
  end

  def create
    Seven.create(seven_params)
  end

  def show
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
