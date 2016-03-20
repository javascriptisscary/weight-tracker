module DaysHelper

  #convoluted date validation 
  def parse_helper(day)
    
    #round weight
    day.weight = day.weight.round(1)
    #change date back to string so it can be parsed by Date.parse
    
    x=day.date.to_s
    
    
    #if first number in string is a zero they inputted the year without using 4 digits
    if x[0] =="0"
      
      return self.errors.add(:date, "not valid")
        
    end
    
    #parse date for validation
    begin
      Date.parse(x)
      rescue ArgumentError
        return self.errors.add(:date, "not valid")
    end
    
     day.date = x
    
     



  #if same date as another entry, return and flash alert
    
      user_days= Day.where(user_id: day.user_id)
      
      user_days.each do |single_day|
        if (single_day.date ==day.date) && (single_day.id != day.id) #in case a user is updating a date the ID would be the same.
          return self.errors.add(:date, 'already logged.')
        end
      end
        
    

    
   

  
  end

end
