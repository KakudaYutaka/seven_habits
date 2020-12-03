
principal = 0 #元金
deposit = 10000 #月々の積立額
years_id = 1 #積立年数(運用年数)
annual_yield_id = 6 #年利
every_year = deposit * 12 #年間積立額
compound = principal 
principal2 = principal

years_id * 12.times do |i|
  compound =(compound + deposit) * (1 + annual_yield_id / 100.to_f / 12) #複利
  principal2 += deposit #元金トータル
end


puts "元金は#{principal}円、月々の積立額は#{deposit}円で年間#{every_year}円積み立て"
puts "運用利回り#{annual_yield_id}%で#{years_id}年経過すると"
puts "#{compound.floor}円" 
puts "元金合計#{principal2}円" 
puts "#{years_id}年で#{compound.floor - principal2.floor}円増えました"
