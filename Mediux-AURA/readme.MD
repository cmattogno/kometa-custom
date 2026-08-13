# How to Get Mediux AURA to work with kometa (and a bash script)
### *looking at you overlays*

## The problem:

I want a nice looking experience and love Mediux for better poster and for episodic title cards (*-thumb.jpg).
Aura wants to talk directly with plex to assign it's images in real time. Because of this, aura provides the folder/file structure that Plex expects.
Kometa doesn't follow that structure and once we break the communication between Plex and Aura we need a script to rename and flatten the structure so Kometa can be in charge. 

plex wants the folder structure to be similar to: `//TV/Arrested Development (2003) {tvdb-72173}/*Season 01/Arrested Development (2003) - S01E01 - Pilot [Bluray-1080p][AC3 2.0][x264].jpg*`

Kometa wants the assets folder like: `//Kometa_assets/TV/Arrested Development (2003) {tvdb-72173}/*S01E01.jpg*`

So my workflow is:
```
00:00 - AURA → auto updates downloads to /Kometa_assets (with NO Plex communication)
02:00 - Move script → shifts episode files to show root - for ingest by Kometa
03:30 - Kometa → finds assets, composites overlays, pushes to Plex # I run only Overlays every day to keep up with new episodes, collections, playlists are weekly or monthly. 
```

## These setting work for me, it took a while to get this whole shebang working and your mileage may vary

## Kometa

```
#-------------------------------------#
#                         SETTINGS
#-------------------------------------#
settings:
  asset_depth: 4
  asset_directory: []
  asset_folders: true
  cache: true
  cache_expiration: 60
  create_asset_folders: true
  dimensional_asset_rename: true
  prioritize_assets: true
```
```
#-------------------------------------#
#                       TV settings
#-------------------------------------#
settings:
  asset_directory:
  - /Your_path/TV
  prioritize_assets: true
#-------------------------------------#
#                      TV  operations
#-------------------------------------#
    operations:
      assets_for_all: true
      assets_for_all_collections: true  
```

```
#-------------------------------------#
#                      Movies settings
#-------------------------------------#
    settings:
      asset_directory:
      - /Kometa_assets/Movies
      prioritize_assets: true
#-------------------------------------#
#                    Movies operations
#-------------------------------------#
    operations:
      assets_for_all: true
      assets_for_all_collections: true
```
## aura - mediux
You need to disable aura and plex communicating or you can watch the posters/thumbs change from the Kometa overlay back to the clean mediux image that is/will be in your assets directoy so kometa can do it's thing without plex and aura mucking things up.

*These are snippets from my aura/config/config.yaml. The config is pretty easy to translate to the web interface. *
```
MediaServer:
    Type: Plex
    URL: [REDACTED].plex.direct:32400
    ApiToken: [REDACTED]
    Libraries:
        - Title: Movies
        - Title: TV Shows
    EnableSortByEpisodeAddedDate: true
    EnablePlexEventListener: false
```
```
AutoDownload:
    Enabled: true
    Cron: 0 0 * * *
```
```
Images:
    CacheImages:
        Enabled: true
    SaveImagesLocally:
        Enabled: true
        Path: /Kometa_assets
        EpisodeNamingConvention: static
```
## bash - ** move-thumbs.sh **
My script is ready for download in this directory

Aura runs at midnight (by default)
My kometa kicks off at 03:30
This script kicks off at 02:00

###My CRONTAB
```
# AURA downloads at its scheduled time
# 02:00 - Move episode files to show root
0 2 * * * /Media_4TB/DOCKER/Kometa/move-thumbs.sh >> /Media_4TB/DOCKER/Kometa/move.log 2>&1
```

