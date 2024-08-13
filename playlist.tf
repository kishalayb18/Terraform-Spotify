resource "spotify_playlist" "fifa" {
  name        = "FIFA playlist"
  description = "this is a football playlist"
  public      = true
  tracks = [
    "4nOygULhEuDO5ZBRNPFaso",
    "0jY618wuln0b5b8sCxFgjk",
    data.spotify_search_track.fifa_search.tracks[1].id,
    # data.spotify_track.fifa_track.tracks[3].id,
    # data.spotify_album.fifa_album.id
  ]
}
