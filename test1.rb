class Second
  def self.convert(s = "1 year 2 months 3 days 2 hours 3 minutes 59 seconds")
    a = s.split(/[^[:word:]]+/)
    year   = get_value(a.find_index{ |e| /year/ =~ e }, a)
    month  = get_value(a.find_index{ |e| /month/ =~ e }, a)
    day    = get_value(a.find_index{ |e| /day/ =~ e }, a)
    hour   = get_value(a.find_index{ |e| /hour/ =~ e }, a)
    minute = get_value(a.find_index{ |e| /minute/ =~ e }, a)
    second = get_value(a.find_index{ |e| /second/ =~ e }, a)
    return (year * 31536000) + (month * 2592000) + (day * 86400) + (hour * 3600) + (minute * 60) + second
  end

  private
  def self.get_value(index, a)
    if index != nil
      r = a.at(index.to_i - 1)
      if r != nil
        return r.to_i
      end
    end
    return 0
  end
end

class Test
  def self.start
    #(1 * 31536000) + (2 * 2592000) + (3 * 86400) + (2 * 3600) + (3 * 60) + 59
    report(1, 36986639 == Second.convert("1 year 2 months 3 days 2 hours 3 minutes 59 seconds"))
    report(2, 71211993 == Second.convert("2 years 3 months 4 days 5 hours 6 minutes 33 seconds"))
    report(3, 8139993 == Second.convert("3 months 4 days 5 hours 6 minutes 33 seconds"))
    report(4, 363993 == Second.convert("4 days 5 hours 6 minutes 33 seconds"))
    report(5, 18393 == Second.convert("5 hours 6 minutes 33 seconds"))
    report(6, 393 == Second.convert("6 minutes 33 seconds"))
    report(7, 33 == Second.convert("33 seconds"))
  end
  private
  def self.report(number, result)
    message = "Test-" + number.to_s
    if result
      message = message + ": successful"
    else
      message = message + ": is failed!"
    end
    puts message
  end
end
