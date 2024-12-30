## note: use the local version of sportdb gems
$LOAD_PATH.unshift( File.expand_path( '../sport.db/season-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sport.db/score-formats/lib' ))
$LOAD_PATH.unshift( File.expand_path( '../sport.db/sportdb-structs/lib' ))
$LOAD_PATH.unshift( File.expand_path( './sports/lib' ))

require 'sports'

