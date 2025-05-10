resource "spotify_playlist" "playlist" {
  name        = "dino"
  description = "This is a playlist created using Terraform"
  tracks = ["1QUU43rTDMnGl4xyaIfsYN"]
}
data "spotify_search_track" "eminem" {
    artist = "Eminem"
}
resource "spotify_playlist" "slimShady" {
    name = "Slim Shady"
    tracks = [data.spotify_search_track.eminem.tracks[0].id,
             data.spotify_search_track.eminem.tracks[1].id,
             data.spotify_search_track.eminem.tracks[2].id,
             data.spotify_search_track.eminem.tracks[3].id,
             data.spotify_search_track.eminem.tracks[4].id]
    description = "This is a playlist created using Terraform"
}