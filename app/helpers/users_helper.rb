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
      return content_tag :span, "You've lost #{change.round(1)} pounds since #{dates.first.date}", class: "green"
    elsif change < 0
      return content_tag :span, "You've gained #{-change.round(1)} pounds since #{dates.first.date}", class: "red"
    else
      return "0."
    end
  end
    
  def total_weight_change(dates)  
    x = dates
    first = x.shift
    last = x.pop
     
    change = (first.weight - last.weight)
     
    if change > 0
      return content_tag :span, "You've lost #{change.round(1)} total pounds", class: "green"
    elsif change < 0
      return content_tag :span, "You've gained #{-change.round(1)} total pounds", class: "red"
    else
      return "0."
    end
     
  end
    
end

