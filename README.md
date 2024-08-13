# Terraform-Spotify

## [spotify Provider](https://registry.terraform.io/providers/conradludgate/spotify/latest/docs)

```tf
provider "spotify" {
  api_key = var.spotify_api_key
}

# See https://github.com/conradludgate/terraform-provider-spotify#how-to-use
# for how to get an api key
variable "spotify_api_key" {
  type = string
}
```

**Required**
- api_key (String) Oauth2 Proxy API Key

**Optional**
- auth_server (String) Oauth2 Proxy URL
- token_id (String) Oauth2 Proxy token ID
- username (String) Oauth2 Proxy username

## Spotify Developer's Dashboard

There are couple of fields that need to be filled

1. app name
```
Kishalay's Spotify Playlist
```

2. Description
```
This playlist is created via terraform
```

3. Redirect URIs
```
http://localhost:27228/spotify_callback
```
4. Click on save

5. This will create a client ID and secret for you

6. Click on settings of the created app to get the client ID and key


## Generate the API key

1. Make sure the docker desktop is running

2. Run the following command

```
docker run --rm -it -p 27228:27228 --env-file .env ghcr.io/conradludgate/spotify-auth-proxy 
```

3. Click on the `Auth URL` which has been generated

4. This will redirect you to the spotify page where you need to login and accept the authorization, when completed it will show `Authorization successful`

5. From the terminal fetch the APIKey and save it to the `tfvars` file

## Configure the Provider

1. Store the APIKey to a .tfvars file
> make sure to keep it inside double quotes, this key has type of String

2. Declare a variable block for the variable that you have defined in the .tfvars file

```tf
variable "spotify_api_key" {
  type = string
}
```

3. Call the variable in the "spotify" provider block


```tf
provider "spotify" {
  api_key = var.spotify_api_key
}
```

## Create the Playlist

1. Create a file named playlist.tf

2. Visit [Spotify Playlist](https://registry.terraform.io/providers/conradludgate/spotify/latest/docs/resources/playlist) to get the resource block for the playlist

```
resource "spotify_playlist" "playlist" {
  name        = "My playlist"
  description = "My playlist is so awesome"
  public      = false

  tracks = [
    data.spotify_track.overkill.id,
    data.spotify_track.blackwater.id,
    data.spotify_track.snowblind.id,
  ]
}

data "spotify_track" "overkill" {
  url = "https://open.spotify.com/track/4XdaaDFE881SlIaz31pTAG"
}
data "spotify_track" "blackwater" {
  url = "https://open.spotify.com/track/4lE6N1E0L8CssgKEUCgdbA"
}
data "spotify_track" "snowblind" {
  url = "https://open.spotify.com/track/7FCG2wIYG1XvGRUMACC2cD"
}
```

**Required**
- name (String) The name of the resulting playlist
- tracks (List of String) A set of tracks for the playlist to contain

**Optional**
- description (String) The description of the resulting playlist
- id (String) The ID of this resource.
- public (Boolean) Whether the playlist can be accessed publically

**Read-only**
- snapshot_id (String)



## Terraform Commands

initialize
```
terraform init
```

format
```
terraform fmt
```

validate
```
terraform validate
```

plan with storing the plan in a file
```
terraform plan -var-file=".tfvars" -out=tfplan
```

apply the planned file
```
terraform apply tfplan
```

or

apply with the tfvars
```
terraform apply -var-file=".tfvars" --auto-approve
```

```

```