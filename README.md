Tips

Don't want to run every collection/metadata/playlist/etc every day?
```
schedule:
          hourly(hr) - can be 12 or 24, also range 01-13 for start/stop
          daily - once a day
          weekly(weekday|weekday) 
          monthly(1) - "last" or date, can stack monthly(15), monthly(last)
          yearly(MM/DD)
          date(MM/DD/YYYY)
          all[weekly(sunday), hourly(17)] - mix and match
```
```       
         |  Change                          |  Requires Restart? |
         |----------------------------------|--------------------|
         | Environment variables            |       ✅ Yes       |
         | Volume mount paths               |       ✅ Yes       |
         | Docker *Compose* changes           |       ✅ Yes       |
         | config.yml edits                 |       ❌ No        |
         | API keys / credentials in config |       ❌ No        |
         | Collection files (repo URLs)     |       ❌ No        |
```
Want to add collection in-line with default collections?
```
sort_title: "!001_Episode title"
        Kometa creates Collections, sometimes I want to add Heists in-line with the defaults. you can find current "sort titles" by Editing the collection, its there.
```
Kometa automatically looks for poster images in your asset directory. To add a custom poster:

    Create a folder in your assets directory matching the separator name:
```
   /Kometa_assets/Movies/
   └── Custom Collections/
       └── poster.png
   ```

2. Or name the file directly:
   ```
   /Kometa_assets/Movies/
   └── Custom Collections.jpg
   ```

I have `assets_for_all: true` and `create_asset_folders: true` in my operations, Kometa will automatically create the folder structure if it doesn't exist.

---
