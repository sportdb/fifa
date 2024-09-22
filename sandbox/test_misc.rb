###########################
#  to run use:
#    $ ruby sandbox/test_misc.rb


## note: use the local version of fifa gem
$LOAD_PATH.unshift( File.expand_path( './lib'))
require 'fifa'



all = Fifa.world.countries
puts "   #{all.size} countries"
#=> 241 countries

fifa = Fifa.countries
puts "   #{fifa.size} countries"
fifa = Fifa.members('fifa')
puts "   #{fifa.size} countries"
#=> 211 countries

uefa =  Uefa.countries
puts "   #{uefa.size} countries"
uefa =  Fifa.members('uefa')
puts "   #{uefa.size} countries"
#=> 55 countries
pp uefa


pp Fifa[ 'aut' ]
pp Fifa[ 'AUT' ]
# pp FIFA[ 'aut' ]
# pp FIFA[ 'AUT' ]

pp Fifa.world.find( 'aut' )
pp Fifa.world.find( 'AUT' )

pp Fifa::VERSION
pp Fifa.banner
pp Fifa.data_dir
pp Fifa.root

puts "bye"