## 3rd party gems
require 'sportdb/structs'    ## pull-in Sports::Country
require 'alphabets'


###
# our own code
require_relative 'fifa/version' # let version always go first

require_relative 'fifa/outline_reader'
require_relative 'fifa/country_reader'

require_relative 'fifa/country_index'
require_relative 'fifa/org_index'


module Fifa
  def self.world
      @world ||=  CountryIndex.read(
                        "#{Fifa.data_dir}/africa/countries.txt",
                        "#{Fifa.data_dir}/asia/countries.txt",
                        "#{Fifa.data_dir}/caribbean/countries.txt",
                        "#{Fifa.data_dir}/central-america/countries.txt",
                        "#{Fifa.data_dir}/europe/countries.txt",
                        "#{Fifa.data_dir}/middle-east/countries.txt",
                        "#{Fifa.data_dir}/north-america/countries.txt",
                        "#{Fifa.data_dir}/pacific/countries.txt",
                        "#{Fifa.data_dir}/south-america/countries.txt",
                        "#{Fifa.data_dir}/countries_history.txt" )
  end

  ## note: only returns fifa member countries (use world.countries for all) !!!
  def self.countries() world.members( :fifa ); end

  ## search service (using world - note: NOT scoped/limted to members only)
  def self.[]( q )   world[ q ]; end
  def self.members( key=:fifa ) world.members( key ); end
end # class Fifa



## add Uefa/Conmebol convenience modules - why? why not?
module Uefa
  def self.countries() Fifa.members(:uefa); end
end

module Conmebol
  def self.countries() Fifa.members( :conmebol ); end
end

## add a convenience upcase alias
FIFA     = Fifa
UEFA     = Uefa
CONMEBOL = Conmebol     # Confederación Sudamericana de Fútbol



puts Fifa.banner   # say hello
