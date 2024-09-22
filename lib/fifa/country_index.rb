
module Fifa


## built-in countries for (quick starter) auto-add
class CountryIndex

  def self.read( path )
    world = new
    recs = CountryReader.read( path )
    world.add( recs )
    world
  end


  def initialize( recs=nil )
    @countries  = []
    @by_code    = {}  ## countries by codes (fifa, internet, etc)
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
    key = q.to_s.downcase   ## allow symbols (and always downcase e.g. AUT to aut etc.)
    @by_code[ key ]
  end
  alias_method :[], :find



  def add( recs )
    @countries += recs

    _add( recs)              ## step one add to our own index
    @orgs.add( recs )   ## step two add to orgs (helper) index (for members)
  end


  def _add( recs )
    recs.each do |rec|
      key = rec.code.downcase    ## add codes lookups - key, fifa, ...
      if @by_code[ key ]
        puts "** !!! ERROR !!! country code (fifa)  >#{rec.code}< already exits!!"
        exit 1
      else
        @by_code[ key ] = rec
      end
    end
  end # method add
end   # class CountryIndex

end   # class Module
