$LOAD_PATH.unshift( File.expand_path( '../../sport.db/sportdb-models/lib' ))
require 'sportdb/models'



SportDb.open( './euro2024.db' )

puts "table stats:"
SportDb.tables



Match = SportDb::Model::Match


Match.order('date, time, pos').each_with_index do |m,i|
    puts "==> #{i}   #{m.team1.name} - #{m.team2.name}"
    pp m
end


puts "bye"

__END__

==> 48   Spain - France
#<SportDb::Model::Match:0x000001bb6b3c9240
 id: 49,
 key: nil,
 event_id: 1,
 pos: 49,
 num: 49,
 team1_id: 5,
 team2_id: 16,
 round_id: 6,
 group_id: nil,
 stage_id: nil,
 team1_key: nil,
 team2_key: nil,
 event_key: nil,
 round_key: nil,
 round_num: nil,
 group_key: nil,
 stage_key: nil,
 date: "2024-07-09",
 time: "21:00",
 postponed: false,
 status: nil,
 ground_id: nil,
 city_id: nil,
 home: true,
 knockout: false,
 score1: 2,
 score2: 1,
 score1et: nil,
 score2et: nil,
 score1p: nil,
 score2p: nil,
 score1i: 2,
 score2i: 1,
 score1ii: nil,
 score2ii: nil,
 next_match_id: nil,
 prev_match_id: nil,
 winner: 1,
 winner90: 1,
 comments: nil,
 created_at: "2025-01-03 18:25:47.357408000 +0000",
 updated_at: "2025-01-03 18:25:47.357408000 +0000">
==> 49   Netherlands - England
#<SportDb::Model::Match:0x000001bb6b3c9100
 id: 50,
 key: nil,
 event_id: 1,
 pos: 50,
 num: 50,
 team1_id: 14,
 team2_id: 12,
 round_id: 6,
 group_id: nil,
 stage_id: nil,
 team1_key: nil,
 team2_key: nil,
 event_key: nil,
 round_key: nil,
 round_num: nil,
 group_key: nil,
 stage_key: nil,
 date: "2024-07-10",
 time: "21:00",
 postponed: false,
 status: nil,
 ground_id: nil,
 city_id: nil,
 home: true,
 knockout: false,
 score1: 1,
 score2: 2,
 score1et: nil,
 score2et: nil,
 score1p: nil,
 score2p: nil,
 score1i: 1,
 score2i: 1,
 score1ii: nil,
 score2ii: nil,
 next_match_id: nil,
 prev_match_id: nil,
 winner: 2,
 winner90: 2,
 comments: nil,
 created_at: "2025-01-03 18:25:47.364225000 +0000",
 updated_at: "2025-01-03 18:25:47.364225000 +0000">
==> 50   Spain - England
#<SportDb::Model::Match:0x000001bb6b3c8fc0
 id: 51,
 key: nil,
 event_id: 1,
 pos: 51,
 num: 51,
 team1_id: 5,
 team2_id: 12,
 round_id: 7,
 group_id: nil,
 stage_id: nil,
 team1_key: nil,
 team2_key: nil,
 event_key: nil,
 round_key: nil,
 round_num: nil,
 group_key: nil,
 stage_key: nil,
 date: "2024-07-14",
 time: "21:00",
 postponed: false,
 status: nil,
 ground_id: nil,
 city_id: nil,
 home: true,
 knockout: false,
 score1: 2,
 score2: 1,
 score1et: nil,
 score2et: nil,
 score1p: nil,
 score2p: nil,
 score1i: 0,
 score2i: 0,
 score1ii: nil,
 score2ii: nil,
 next_match_id: nil,
 prev_match_id: nil,
 winner: 1,
 winner90: 1,
 comments: nil,
 created_at: "2025-01-03 18:25:47.370935000 +0000",
 updated_at: "2025-01-03 18:25:47.370935000 +0000">

