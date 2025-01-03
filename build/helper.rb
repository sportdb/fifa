## note: use the local version of gems
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-structs/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/parser/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/quick/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-catalogs/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-search/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-readers/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-models/lib' ))



## our own code
require 'sportdb/catalogs'
require 'sportdb/formats'

require 'sportdb/readers'


SportDb::Import.config.catalog_path = '../../sport.db/catalog/catalog.db'

puts "  #{CatalogDb::Metal::Country.count} countries"
puts "  #{CatalogDb::Metal::Club.count} clubs"
puts "  #{CatalogDb::Metal::NationalTeam.count} national teams"
puts "  #{CatalogDb::Metal::League.count} leagues"



