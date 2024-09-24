
module Fifa


## built-in countries for (quick starter) auto-add
class CountryIndex

  def self.read( *paths )
    recs = []
    paths.each do |path|
      recs += CountryReader.read( path )
    end
    new( recs )
  end


  def initialize( recs=nil )
    @countries  = []
    @by_code    = {}  ## countries by codes (fifa, internet, etc)
    @by_name    = {}  ##  normalized name
    @orgs       = OrgIndex.new

    add( recs )   if recs
  end

  def countries() @countries; end
  def size()  @countries.size; end
  def each( &blk ) @countries.each { |country| blk.call( country ) }; end



  def members( key=:fifa )   ## default to fifa members
    @orgs.members( key )
  end

  ## for testing/debugging return org keys
  ##   return OrgIndex instead - why? why not?
  def orgs() @orgs.keys; end


  def find( q )
    ## todo/fix - add find by name (find_by_name_and_code) - why? why not?
    find_by_code( q )
  end

  def find_by_code( code )
    key = code.to_s.downcase   ## allow symbols (and always downcase e.g. AUT to aut etc.)
    @by_code[ key ]
  end
  alias_method :[], :find_by_code

  def find_by_name( name )
     key = normalize( unaccent( name.to_s ))
     @by_name[ key ]
  end



  include SportDb::NameHelper
  ## strip_year, strip_lang, normalize etc.


  def add( recs )
    @countries += recs

    _add( recs)              ## step one add to our own index
    @orgs.add( recs )   ## step two add to orgs (helper) index (for members)
  end


  def _add( recs )
    recs.each do |rec|
      ## step 1 - add code lookups - key, fifa, ...
      ##  todo/fix - add  two-letter keys and alt keys - why? why not?
      key = rec.code.downcase
      if @by_code[ key ]
        puts "** !!! ERROR !!! country code (fifa)  >#{rec.code}< already exits!!"
        exit 1
      else
        @by_code[ key ] = rec
      end


      ## step 2 - add name lookups
      keys = [ normalize( unaccent( strip_year( rec.name ))) ]

      rec.alt_names.each do |name|
         keys <<  normalize( unaccent( strip_year(strip_lang(name)) ))
      end
      ## note - allow duplicates only if same country
      ##   e.g Panama, Panamá
      keys = keys.uniq

      keys.each do |key|
        if @by_name[ key ]
          puts "** !!! ERROR country (norm) name  >#{key}< already exits"
          exit 1
        else
          @by_name[ key ] = rec
        end
      end
    end
  end # method add
end   # class CountryIndex
end   # module Fifa
