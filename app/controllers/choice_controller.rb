class ChoiceController < ApplicationController
  def check
    @city = City.new
  end

  def result
    save_choice_to_db


    @grades_charts = {}
    @grades = []

    Choice.last.results.each do | grade | 
      @grades.push( grade )
      @grades_charts[ grade[0] ] = grade[1]
    end


    @draw = {}

    @choice = Choice.last
    @draw['choice'] = @choice
    @draw['grades'] = @grades
    @draw['grades_charts'] = @grades_charts
    render "result"

  end

  def save_choice_to_db
    choice = Choice.new

    user_choice = params['city']

    user_choice.each do |criteria|  
      choice[ criteria[0] ] = user_choice[ criteria[0] ]    
    end



    results = {}
    cities_grades().each do | grade |
      results[ grade[0].name] = grade[1]
    end

    choice.save_the_results( results )
    choice.save
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
