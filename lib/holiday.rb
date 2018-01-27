require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each {|hol, sup_array| sup_array << supply}
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = { holiday_name => supply_array }
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |seas, hols|
    puts "#{seas.capitalize}:"
    hols.each do |hol, s_array|
      nu_hol = hol.to_s
      if nu_hol.include? "_"
        nu_hol.gsub!(/_/, " ")
      end
      nu_arr = nu_hol.split(" ")
      nu_arr.each do |wrd|
          wrd.capitalize!
      end
      hol = nu_arr.join(" ")
      puts "  #{hol}: #{s_array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_arr = []
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |seas, hols|
    hols.collect do |hol, s_arr|
      if s_arr.include? "BBQ"
        bbq_arr << hol
      end
    end
  end
  bbq_arr
end
