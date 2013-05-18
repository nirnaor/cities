class ChoiceController < ApplicationController
  def check
    @city = City.new

    City.all.each do | city |
      puts city['name'], city_grade( city )
    end
    render "result"
    
  end


  def city_grade( city )
    if params[:city] != nil  
      result = 0
      params[:city].keys.each do |pr| 
        result += Integer(city[pr]) * Integer(params["city"][pr]) 
      end
      result
    end

  end
end
