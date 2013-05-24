class Choice < ActiveRecord::Base
  attr_accessible :costs, :education, :environment, :security, :transportation, :resultsjson



  def results; JSON.parse(self.resultsjson); end

  def results=(value); self.resultsjson = value.to_json; end

  def save_the_results( value )
   self.resultsjson = value.to_json
  end
  #
  #

  #def nir( bla )
    #:resultsjson = bla.to_json
  #end

end
