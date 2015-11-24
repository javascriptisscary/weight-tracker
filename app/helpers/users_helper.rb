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
        return content_tag :span, "You've lost #{change.round(1)} pounds over your last 7 dates!", class: "green"
    elsif change < 0
      return content_tag :span, "You've gained #{change.round(1)} pounds. Time to get refocused!", class: "red"
    else
      return "0."
    end
    
  end
    
end

