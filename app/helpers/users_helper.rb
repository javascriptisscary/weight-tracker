module UsersHelper
  def weight_change(dates)
    dates_array = []
    dates.each do |x|
      dates_array.push(x.weight)
    end
  
    first= dates_array.shift
    last= dates_array.pop
    change =first-last
    
    if change > 0
        return "You've lost #{change} pounds over your last 7 dates!"
    elsif change < 0
      return "You've gained #{change} pounds. Time to get refocused!"
    else
      return "0."
    end
    
  end
    
end

