
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guitarparty_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guitarparty_client

Retrieve an API key from http://www.guitarparty.com/developers/api-key/

## Usage

To initialize:

```ruby
require 'guitarparty_client'
guitarparty = Guitarparty.new("API-KEY")
```

To get song information:

```ruby
require 'guitarparty_client'
guitarparty = GuitarpartyClient.new("API-KEY")

guitarparty.song_by_name("Jolene")

guitarparty.song_by_id(1)
```
Both return: 

```json
{
    "body": "...", 
    "chords": [...],
    "tags": [], 
    "title": "Jolene", 
    "uri": "/v2/songs/5/"
}
```

To get lyrics/chords: 


```ruby
require 'guitarparty_client'
guitarparty = GuitarpartyClient.new("API-KEY")

guitarparty.lyrics_by_name("Jolene")

guitarparty.lyrics_by_id(1)
```

Both return the lyrics and chords:

"Capo á 4.bandi

Jo[Am]lene, Jo[C]lene, Jo[G]lene, Jo[Am]lene!
I'm b[G]egging of you, please don't take my [Am]man.
Jo[Am]lene, Jo[C]lene, Jo[G]lene, Jo[Am]lene!
Pl[G]ease don't take him, just because you [Am]can.
..."

To get artist information: 

```ruby
require 'guitarparty_client'
guitarparty = GuitarpartyClient.new("API-KEY")

guitarparty.artist_by_name("Dolly Parton")

guitarparty.artist_by_id(1)
```

Both return: 

```json

{
    "objects": [
        {
            "bio": "Dolly Rebecca Parton (born January 19, 1946) ...", 
            "name": "Dolly Parton", 
            "slug": "dolly-parton", 
            "uri": "/v2/artists/1/"
        }
    ],
    "objects_count": 1
}
```

To get only artist biography: 

```ruby
require 'guitarparty_client'
guitarparty = GuitarpartyClient.new("API-KEY")

guitarparty.bio_by_name("Dolly Parton")

guitarparty.bio_by_id(1)
```

Both return a string of the full bio as shown above.

To get chord information: 

```ruby
require 'guitarparty_client'
guitarparty = GuitarpartyClient.new("API-KEY")

guitarparty.get_chord("Am")
```
Returns chord information: 

```json
{
  "objects": [
    {
      "code": "xo221o",
      "image_url": "http://chords.guitarparty.com/chord-images/guitar_Am_xo221o.png",
      "instrument": {
        "name": "Guitar",
        "safe_name": "guitar",
        "tuning": "EADGBE"
      },
      "name": "Am",
      "uri": "/v2/chords/46345/"
    }
  ],
  "objects_count": 1
}
```

And

```ruby
guitarparty.get_chord_variations("Am")
```

Returns all variations of the chord.