require 'rails_helper'

RSpec.describe Seven, type: :model do
  before do
    @seven =  FactoryBot.build(:seven)
  end

  describe '複利計算機' do
    context '複利計算機がうまくいくとき' do
      it 'principal, deposit, annual_yield_id, years_id全て存在すれば計算される' do
        expect(@seven).to be_valid
      end
    end

    
  end

end
