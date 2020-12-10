class Seven < ApplicationRecord
  with_options presence: true do
    validates :principal, numericality: { only_integer: true, allow_blank: true, message: 'は半角数字で入力してください' }
    validates :deposit, numericality: { only_integer: true, allow_blank: true, message: 'は半角数字で入力してください' }
  end

  validates :principal, numericality: { less_than: 10_000_001, allow_blank: true, message: 'は10000000以下で入力してください' }
  validates :deposit, numericality: { less_than: 1_000_001, allow_blank: true, message: 'は1000000以下で入力してください' }

  with_options numericality: { other_than: 0, message: 'を選んでください' } do
    validates :annual_yield_id
    validates :years_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :annual_yield
  belongs_to_active_hash :years
end
