require 'rest-client'
require 'guitarparty_client'

class GuitarpartyClient
    module Songs

        def song_by_name(name)
            RestClient.get "#{@base_url}songs/?query=#{name}", {'Guitarparty-Api-Key' => @api_key}
        end

        def song_by_id(id)
            RestClient.get "#{@base_url}songs/#{id}/", {'Guitarparty-Api-Key' => @api_key}
        end

        def lyrics_by_name(name)
            response = RestClient.get "#{@base_url}songs/?query=#{name}", {'Guitarparty-Api-Key' => @api_key}
            JSON.parse(response)["objects"][0]["body"]
        end

        def lyrics_by_id(id)
            response = RestClient.get "#{@base_url}/songs/#{id}/", {'Guitarparty-Api-Key' => @api_key}
            JSON.parse(response)["body"]
        end
    end
end