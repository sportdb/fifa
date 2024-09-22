##
# bundle all football.db /openfootball/national-teams .txt files
##              into a single countries.txt

## note: use the local version of formats gem
$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-formats/lib' ))

require 'sportdb/formats'    ## todo/fix: use "local" version e.g. patch load path - why? why not?


TEAMS_DIR = '../../../openfootball/national-teams'    ## source repo directory path


datafiles = SportDb::Package.find_teams( TEAMS_DIR )
pp datafiles


Datafile.write_bundle( './config/countries.txt',
                       datafiles: datafiles,
                       header: <<TXT )
##########################################
# auto-generated all-in-one single datafile countries.txt bundle
#    on #{Time.now} from #{datafiles.size} datafile(s)
#  please, do NOT edit here; use the source
#    see https://github.com/openfootball/national-teams - updates welcome!
TXT
