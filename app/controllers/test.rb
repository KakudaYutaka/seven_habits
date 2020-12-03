#念のため保管
# principal = 0 #元金
# deposit = 10000 #月々の積立額
# years_id = 1 #積立年数(運用年数)
# annual_yield_id = 6 #年利
# @every_year = @seven.deposit * 12 #年間積立額
# @compound = @seven.principal 
# @principal2 = @seven.principal

# @seven.years_id * 12.times do |i|
#   @compound =(@seven.compound + @seven.deposit) * (1 + @seven.annual_yield_id / 100.to_f / 12) #複利
#   @principal2 += @seven.deposit #元金トータル
# end

# @difference = (@compound.floor - @principal2.floor)


# puts "元金は#{@seven.principal}円、月々の積立額は#{@seven.deposit}円で年間#{@every_year}円積み立て"
# puts "運用利回り#{@seven.annual_yield_id}%で#{@seven.years_id}年経過すると"
# puts "#{@compound.floor}円" 
# puts "元金合計#{@principal2}円" 
# puts "#{@seven.years_id}年で#{@difference}円増えました"
