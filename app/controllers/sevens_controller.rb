class SevensController < ApplicationController
  before_action :calc_params, only: :show

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

  def calc_params
    @seven = Seven.find(params[:id])
    @every_year = @seven.deposit * 12 #年間積立額
    @compound = @seven.principal 
    @principal2 = @seven.principal

    @seven.years_id * 12.times do |i|
      @compound =(@compound + @seven.deposit) * (1 + @seven.annual_yield_id / 100.to_f / 12) #複利
      @principal2 += @seven.deposit #元金トータル
    end

    @difference = (@compound.floor - @principal2.floor)

  end

end