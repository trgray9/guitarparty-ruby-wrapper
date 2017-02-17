require 'rest-client'
require 'guitarparty_client'

class GuitarpartyClient
    module Chords

        def get_chord(chord)
            RestClient.get "#{@base_url}chords/?query=#{chord}", {'Guitarparty-Api-Key' => @api_key}            
        end

        def get_chord_variations(chord)
            RestClient.get "#{@base_url}chords/?query=#{chord}/?variations=true", {'Guitarparty-Api-Key' => @api_key}            
        end
    end
end