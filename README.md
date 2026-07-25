# Tips

## Collections only on TV Shows
`docker exec kometa python /app/kometa/kometa.py --config /config/config.yml --run --collections-only --library "TV Shows"`

## Collections only on ALL libraries
`docker exec kometa python /app/kometa/kometa.py --config /config/config.yml --run --collections-only`

## Dry run first (preview without changes)
`docker exec kometa python /app/kometa/kometa.py --config /config/config.yml --run --collections-only --library "TV Shows" --dry-run`

## Overlays only instead
`docker exec kometa python /app/kometa/kometa.py --config /config/config.yml --run --overlays-only --library "TV Shows"`

## schedule:
```
          - hourly(hr) - can be 12 or 24, also range 01-13 for start/stop
          - daily - once a day
          - weekly(weekday|weekday) 
          - monthly(1) - "last" or date, can stack monthly(15), monthly(last)
          - yearly(MM/DD)
          - date(MM/DD/YYYY)
          - all[weekly(sunday), hourly(17)] - mix and match
```
## When to restart after edits


| Change  | Restart? |
| ------------- | ------------- |
| Environment variables  | ✅ Yes  |
| Volume mount paths  | ✅ Yes  |
| Docker **Compose** changes  | ✅ Yes  |
| config.yml edits | ❌ No  |
| API keys/credentials in config  | ❌ No  |
| Collection files (repo URLs)  | ❌ No  |


## Want to add collection in-line with default collections?

`sort_title: "!001_Episode title"`

*Kometa creates Collections, sometimes I want to add Heists in-line with the defaults. you can find current "sort titles" by Editing the collection, its there.*

## To add a custom poster:
I have `assets_for_all: true` and `create_asset_folders: true` in my operations, Kometa will automatically create the folder structure if it doesn't exist.

   ```    
   /Kometa_assets/Movies/
   └── $_CustomCollectionName/
       └── poster.png
   ```

or just name the file directly:
   ```
   /Kometa_assets/Movies/
   └── $_CustomCollectionName.jpg
   ```
