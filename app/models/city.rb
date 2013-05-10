class City < ActiveRecord::Base
  attr_accessible :costs, :education, :name, :enviornment, :security, :transportation
  validates :name, :presence => true
  validates :costs, :education, :enviornment, :security,
    :inclusion => { :in => 1..10, :message => "value must be betwene 1 and 5" } 
end
