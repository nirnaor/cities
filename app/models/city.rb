class City < ActiveRecord::Base
  attr_accessible :costs, :education, :name, :enviornment, :security, :transportation
  validates :name, :presence => true
  validates :costs, :education, :enviornment, :security,
    :inclusion => { :in => 1..20, :message => "value must be betwene 1 and 20" } 
end
