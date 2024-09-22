## note: use the local version of gems
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( './lib'))

require 'fifa'


## todo/fix: add country dependency info e.g. England < UK  etc.


## build a summary page
countries = Fifa.countries
countries = countries.sort_by {|country| country.name }

buf = String.new
buf << "# Countries A-Z (#{countries.size})\n\n"
buf << "| Name   | Code  | Tags | Alt. Names |\n"
buf << "|--------|-------|------|------------|\n"
countries.each do |country|
  buf << "| #{country.name}"
  buf << " | #{country.code }"
  buf << " | #{country.tags.join( ' › ' )}"
  buf << " | #{country.alt_names.join( ' · ' )}"
  buf << " |\n"
end

puts buf

File.open( './SUMMARY_AZ.md', 'w:utf-8') do |f|
  f.write( buf )
end
