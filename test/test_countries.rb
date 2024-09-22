###
#  to run use
#     ruby test/test_countries.rb


require_relative 'helper'

class TestCountries < Minitest::Test

  def test_read_countries
    recs = Fifa::CountryReader.read( "#{Fifa.data_dir}/africa/countries.txt" )
    ## pp recs

    assert_equal [{ key: 'bi', code: 'BDI', name: 'Burundi',   tags: ['fifa','caf','cecafa']},
                  { key: 'dj', code: 'DJI', name: 'Djibouti', tags: ['fifa','caf','cecafa']}],
                 recs[0..1].map { |rec| { key: rec.key, code: rec.code, name: rec.name, tags: rec.tags }}
  end


  def test_countries
    pp Fifa.world.countries

    eng = Fifa['ENG']
    assert_equal eng, Fifa['eng']
    assert_equal eng, Fifa[:eng]

    assert_equal 'eng',           eng.key
    assert_equal 'England',       eng.name
    assert_equal 'ENG',           eng.code
    assert_equal ['fifa','uefa'], eng.tags


    aut  = Fifa['AUT']
    assert_equal aut, Fifa['aut']
    assert_equal aut, Fifa[:aut]

    assert_equal 'at',            aut.key
    assert_equal 'Austria',       aut.name
    assert_equal 'AUT',           aut.code
    assert_equal ['fifa','uefa'], aut.tags
  end

end # class TestCountries
