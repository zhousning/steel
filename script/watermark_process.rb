# coding: utf-8
require  'find'
require 'mini_magick'
require 'logger'
  
result_path = "/home/zn/work/steel/app/assets/images/CssTemplateImages/watermarkresult"
source_path = "/home/zn/work/steel/app/assets/images/CssTemplateImages/test/"
smallmark = "/home/zn/work/steel/app/assets/images/smallmark.jpg"
bigmark = "/home/zn/work/steel/app/assets/images/bigmark.jpg"

Dir::mkdir(result_path) unless File.directory? result_path

logger = Logger.new("watermark_running.log")

Find.find(source_path) do |filename|
  if filename =~ /\.(jpg|png|gif)$/i
    basename = File::basename(filename)
    begin
      first_image  = MiniMagick::Image.open(filename)
      if first_image.width > 450
        second_image = MiniMagick::Image.open(bigmark)
        position ="+20+20"
      else
        second_image = MiniMagick::Image.open(smallmark)
        position ="+20+20"
      end
      mark_process(first_image, second_image, position, basename)
      logger.info "watermark  process success: #{basename}"
    rescue
      logger.error "watermark process error: #{basename}"
    end
  end
end

def mark_process(first_image, second_image, position, basename)
  result = first_image.composite(second_image) do |c|
    c.compose "Over"
    c.geometry position 
  end
  result.write "#{result_path}/#{basename}"
end
