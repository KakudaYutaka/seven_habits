class Seven < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :annual_yield_id
  belongs_to_active_hash :years_id
end
