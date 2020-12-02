class Seven < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :annual_yield
  belongs_to_active_hash :years
end
