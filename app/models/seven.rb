class Seven < ApplicationRecord

  with_options presence: true do
    validates :principal, numericality: { only_integer: true, allow_blank: true, message: 'Half-width number' }
    validates :deposit, numericality: { only_integer: true, allow_blank: true, message: 'Half-width number' }
  end


  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :annual_yield_id
    validates :years_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :annual_yield
  belongs_to_active_hash :years
end
