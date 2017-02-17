require "guitarparty_client/version"
require "guitarparty_client/songs"
require "guitarparty_client/artists"
require "guitarparty_client/chords"

class GuitarpartyClient
    include Songs
    include Artists
    include Chords

    def initialize(api_key)
        @api_key = api_key
        @base_url = "http://api.guitarparty.com/v2/"
    end

end