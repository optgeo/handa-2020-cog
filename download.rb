require 'tmpdir'
require './constants.rb'

def process(tmpdir, grid, year, ext)
  fn = "#{grid.downcase}_#{year}.#{ext}"
  url = "https://www.city.handa.lg.jp/kikaku/shise/johoseisaku/opendata/documents/#{fn}"
  system "curl --retry 5 -o #{tmpdir}/#{fn} #{url}"
end

def translate(tmpdir, grid, year)
  system <<-EOS
gdal_translate -of COG -a_srs EPSG:6675 -co COMPRESS=JPEG \
#{tmpdir}/#{grid.downcase}_#{year}.jpg #{grid.downcase}_#{year}.tif
  EOS
end
  
year = 2020
Dir.mktmpdir('handa-2020-cog') do |tmpdir|
  n = GRIDS.size
  GRIDS.each_with_index do |grid, i|
    $stderr.print "[#{i}/#{n}] #{grid}\n"
    %w{jpg jgw}.each do |ext|
      process(tmpdir, grid, year, ext)
    end 
    translate(tmpdir, grid, year)
  end
end

