require 'spec_helper'
require 'json'

API_CODE = "fc7fa665c719f7408ea0334905012b6a16a6e9b7"

describe GuitarpartyClient do
  test_gp = GuitarpartyClient.new(API_CODE)
  let(:song_input) {'Jolene'}
  let(:artist_input) {'Dolly Parton'}
  let(:chord_input) {'Am'}
  let(:output_song) {test_gp.song_by_name(song_input)}
  let(:output_artist) {test_gp.artist_by_name(artist_input)}
  let(:output_chord) {test_gp.get_chord(chord_input)}

  it 'has a version number' do
    expect(GuitarpartyClient::Version::VERSION).not_to be nil
  end

  it 'returns a 200 response for a song' do
    expect(output_song.code).to eq(200)
  end
  it 'returns a 200 response for an artist' do
      expect(output_artist.code).to eq(200)
  end
  it 'returns a 200 response for a chord' do
      expect(output_chord.code).to eq(200)
  end
end

describe GuitarpartyClient::Artists do
    test_gp = GuitarpartyClient.new(API_CODE)
    let(:input) {'Dolly Parton'}
    let(:output) {test_gp.artist_by_name(input)}
    let(:bio_output) {"Dolly Rebecca Parton (born January 19, 1946) is an American country singer, songwriter, composer, producer, entrepreneur, author and actress.  Parton began performing as a child, singing on local radio and television in East Tennessee. At age 12 she was appearing on Knoxville TV, and at 13, she was recording on a small label and appearing at the Grand Ole Opry in Nashville. When she graduated from high school in 1964 she moved to Nashville, taking many traditional elements of folklore and popular music from East Tennessee with her. "}

    it 'searches by name' do
        output_hash = JSON.parse(output)
        artist_name = output_hash["objects"][0]["name"]
        expect(artist_name).to eq("Dolly Parton")
    end

    it 'searches by id' do
        id = test_gp.artist_by_id(1)
        artist_name = JSON.parse(id)["name"]
        expect(artist_name).to eq("Dolly Parton")
    end

    it 'returns the bio by name' do
        bio = test_gp.bio_by_name(input)
        expect(bio).to eq(bio_output)
    end

    it 'returns the bio by id' do
        bio = test_gp.bio_by_id(1)
        expect(bio).to eq(bio_output)
    end
end

describe GuitarpartyClient::Songs do
  test_gp = GuitarpartyClient.new(API_CODE)
  let(:input) {'Jolene'}
  let(:output) {test_gp.song_by_name(input)}

  it 'searches by name' do
    output_hash = JSON.parse(output)
    artist_name = output_hash["objects"][0]["authors"][0]["name"]
    expect(artist_name).to eq("Dolly Parton")
  end

  it 'searches by id' do 
    id = test_gp.song_by_id(5)
    song_title = JSON.parse(id)["title"]
    expect(song_title).to eq("Jolene")
  end
end    
