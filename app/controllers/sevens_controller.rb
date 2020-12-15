class SevensController < ApplicationController
  before_action :calc_params, only: :show
  before_action :show_set, only: :show

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
    @column_chart = { '元金' => @seven.principal, "#{@seven.years_id}年間積立合計" => @deposit2, "#{@seven.years_id}年後" => @compound.floor,"#{@seven.years_id}年後普通預金" => @bank.floor }
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

  def commentary
  end

  private

  def seven_params
    params.require(:seven).permit(:principal, :deposit, :annual_yield_id, :years_id)
  end

  def calc_params
    @seven = Seven.find(params[:id])
    @every_year = @seven.deposit * 12 # 年間積立額
    @compound = @seven.principal
    @bank = @seven.principal
    @principal2 = @seven.principal
    @deposit2 = @seven.deposit * 12 * @seven.years_id # 毎月積立額*12ケ月*年数

    (12 * @seven.years_id).times do |_i|
      @compound = (@compound + @seven.deposit) * (1 + @seven.annual_yield_id / 100.to_f / 12) # 複利
      @principal2 += @seven.deposit # 元金トータル
    end
    
    (12 * @seven.years_id).times do |_i|
      @bank = (@bank + @seven.deposit) * (1 +  1 / 10000.to_f / 12) # 複利
    end

    def digit(str)
      digit_str = str
      digit_str.insert(-5, '万') if digit_str.length >= 5
      digit_str.insert(-10, '億') if digit_str.length >= 10
      digit_str.insert(-15, '兆') if digit_str.length >= 15
      digit_str.insert(-20, '京') if digit_str.length >= 20
      digit_str
    end
    
    str = @compound.floor.to_s
    
    @digit_compound = digit(str)

    @difference = (@compound.floor - @principal2.floor) # 複利結果から元金トータルの差額
    @bank_difference = (@bank.floor - @principal2.floor) # 複利結果から元金トータルの差額
  end

  def show_set #レコード作成2秒経過でアクセス不可
    if Time.current > @seven.created_at + 2
      redirect_to root_path
    end
  end
end
