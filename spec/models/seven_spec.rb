require 'rails_helper'

RSpec.describe Seven, type: :model do
  before do
    @seven = FactoryBot.build(:seven)
  end

  describe '複利計算機' do
    context '複利計算機がうまくいくとき' do
      it 'principal, deposit, annual_yield_id, years_id全て存在すれば計算される' do
        expect(@seven).to be_valid
      end
    end

    context '複利計算機ががうまくいかないとき' do
      it 'principalが空だと計算出力されない' do
        @seven.principal = ''
        @seven.valid?
        expect(@seven.errors.full_messages).to include('元金を入力してください')
      end
      it 'principalが半角数字以外だと計算出力されない' do
        @seven.principal = '３０００'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('元金は半角数字で入力してください')
      end
      it 'principalが10000001以上だと計算出力されない' do
        @seven.principal = '10000001'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('元金は10000000以下で入力してください')
      end
      it 'depositが空だと計算出力されない' do
        @seven.deposit = ''
        @seven.valid?
        expect(@seven.errors.full_messages).to include('毎月積立額を入力してください')
      end
      it 'depositが半角数字以外だと計算出力されない' do
        @seven.deposit = '３０００'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('毎月積立額は半角数字で入力してください')
      end
      it 'depositが10000001以上だと計算出力されない' do
        @seven.deposit = '10000001'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('毎月積立額は1000000以下で入力してください')
      end
      it 'annual_yield_idが0だと計算出力されない' do
        @seven.annual_yield_id = '0'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('年利率を選んでください')
      end
      it 'years_idが0だと計算出力されない' do
        @seven.years_id = '0'
        @seven.valid?
        expect(@seven.errors.full_messages).to include('積立年数を選んでください')
      end
    end
  end
end
