class ChoiceController < ApplicationController
  def check
    @city = City.new
  end

  def result
    @grades = cities_grades()


    @grades_charts = {}

    @grades.each do | grade | 
      @grades_charts[ grade[0].name ] = grade[1]
    end

    @choice = params['city']
    puts @grades
    render "result"
  end


  def cities_grades()
    puts "these are the city grades"
    puts "************************"
    cities_grades = {}
    City.all.each do | city |
      #puts city['name'], city_grade( city )
      cities_grades[ city ] = city_grade( city )
    end
    cities_grades
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
