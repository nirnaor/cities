class ChoiceController < ApplicationController
  def check
    @city = City.new
  end

  def result
    @city = City.new
    save_choice_to_db
    @draws = []

    Choice.find(:all, :limit => 5, :order=> 'created_at desc').each do | choice | 
      @draws.push( draw_for( choice ) )
    end
    render "result"
  end


  def draw_for( choice )
    grades_charts = {}
    grades = []

    choice.results.each do | grade | 
      grades.push( grade )
      grades_charts[ grade[0] ] = grade[1]
    end


    draw = {}

    draw['choice'] = choice
    draw['grades'] = grades
    draw['grades_charts'] = grades_charts
    draw
  end

  def save_choice_to_db
    choice = Choice.new

    user_choice = normalise_choice( params['city'] )
    

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


  def normalise_choice( user_choice )
    sum = 0 
    user_choice.each do | item | 
      sum += Integer( item[1] ) 
    end


    result = {}
    proportion = sum / 100.0 

    user_choice.each do | item | 
      result[ item[0]] = Integer( item[1] ) / proportion
    end
    result
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
