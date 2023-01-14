desc 'download JPEG+jgw files'
task :download do
  sh "ruby download.rb"
end

desc 'merge into handa.tif'
task :merge do
  sh <<-EOS
gdalwarp -of COG -co COMPRESS=JPEG -dstnodata 255,255,255 \
-overwrite 07*.tif handa.tif
  EOS
end

