FactoryBot.define do
  factory :seven do
    principal { 1_000_000 }
    deposit { 30_000 }
    annual_yield_id { 10 }
    years_id { 20 }
  end
end
