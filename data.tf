# data block is used to fetch the data from the platform

# data "spotify_track" "fifa_track" {
#   url = "https://open.spotify.com/album/5htwZrf4lCiZ6GTj9Z0CMo"
# }
data "spotify_search_track" "fifa_search" {
  artist = "Shakira"
}

data "spotify_album" "fifa_album" {
  spotify_id = "35axN2yrxRiycF2pA8mZaB"
}