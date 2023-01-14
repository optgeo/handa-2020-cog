# handa-2020-cog
COG from 2020年（令和2年）行政活動情報・航空写真 of 愛知県半田市

![handa-cogeo](https://user-images.githubusercontent.com/18297/212474212-3516fd4c-d348-455f-a8ba-bed7740a044e.jpg)

## What has been done with repository
Created a single COG (Cloud Optimized GeoTIFF) file from a bunch of JPEG with World File data. 

## Demo
1. Open https://cogeo.xyz/
2. Enter https://x.optgeo.org/handa.tif as COG url there

## About the source
The source data are aerial photos taken by and provided from a municipal government in Japan. 

- [2020年（令和2年）行政活動情報・航空写真 (愛知県半田市)](https://www.city.handa.lg.jp/kikaku/shise/johoseisaku/opendata/data_kokupict_2020.html)

## How to build
```zsh
git clone git@github.com:optgeo/handa-2020-cog
cd handa-2020-cog
rake download
rake merge
```
Then you get `./handa.tif`. 

Enjoy!
