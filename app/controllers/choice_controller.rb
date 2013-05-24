class ChoiceController < ApplicationController
  def check
    @city = City.new
  end

  def result
    @grades = cities_grades()

    choice = Choice.new
    results = {}
    #choice.results = []

    user_choice = params['city']

    user_choice.each do |criteria|  
      puts "criteria:" +  criteria[0]   
      puts "value:" +  user_choice[ criteria[0] ]    
      choice[ criteria[0] ] = user_choice[ criteria[0] ]    
    end




    @grades_charts = {}

    @grades.each do | grade | 
      @grades_charts[ grade[0].name ] = grade[1]
      results[ grade[0].name ] = grade[1]
      #choice.results.push( [ grade[0], grade[ 1 ] ]  )
    end

    choice.save_the_results( results )
    choice.save
    @choice = params['city']
    render "result"

  end


  def cities_grades
    cities_grades = {}
    City.all.each do | city |
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
