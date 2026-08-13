# How to Get Mediux AURA to work with kometa (and a bash script)
### *looking at you overlays*

## These setting work for me, it took a while to get this whole shebang working and your mileage may vary

This assumes you have both Kometa & aura running in docker (I run Plex on the host)
My aura.yaml config is avail here in GitHub

The secret is to get aura to download all the files into your Kometa "assets" folder structure.

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
These are snippets from my aura/config/config.yaml. The config is pretty easy to translate to the web interface. 

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
Images:
    CacheImages:
        Enabled: true
    SaveImagesLocally:
        Enabled: true
        Path: /Kometa_assets
        EpisodeNamingConvention: static
```
## bash - ** move-thumbs.sh **






# Heading 1
## Heading 2
### Heading 3

**bold** or __bold__
*italic* or _italic_
~~strikethrough~~
***bold italic***  

- Item one
- Item two
  - Nested item
  - Another nested

  1. First item
2. Second item
3. Third item

```code
block
```

| Header | Header |
|--------|--------|
| Cell   | Cell   |
| Cell   | Cell   |
