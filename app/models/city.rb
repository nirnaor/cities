class City < ActiveRecord::Base
  attr_accessible :costs, :education, :name, :pollution, :security, :transportation
  validates :name, :presence => true
  validates :costs, :education, :pollution, :security,
    :inclusion => { :in => 1..10, :message => "value must be betwene 1 and 5" } 
end
