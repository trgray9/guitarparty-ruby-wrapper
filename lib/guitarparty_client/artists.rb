require 'rest-client'
require 'guitarparty_client'
require 'json'

class GuitarpartyClient
    module Artists

        def artist_by_name(artist)
            artist.gsub!(/\s/,'+')
            RestClient.get "#{@base_url}artists/?query=#{artist}", {'Guitarparty-Api-Key' => @api_key}
        end

        def artist_by_id(id)
            RestClient.get "#{@base_url}artists/#{id}/", {'Guitarparty-Api-Key' => @api_key}
        end

        def bio_by_name(artist)
            artist.gsub!(/\s/,'+')
            response = RestClient.get "#{@base_url}artists/?query=#{artist}", {'Guitarparty-Api-Key' => @api_key}
            JSON.parse(response)["objects"][0]["bio"]
        end

        def bio_by_id(id)
            response =RestClient.get "#{@base_url}artists/#{id}/", {'Guitarparty-Api-Key' => @api_key}
            JSON.parse(response)["bio"]
        end
    end
end