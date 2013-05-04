class City < ActiveRecord::Base
  attr_accessible :costs, :education, :name, :pollution, :security, :transportation
end
