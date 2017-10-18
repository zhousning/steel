# coding: utf-8
require 'find'
require 'mini_magick'
require 'logger'
  
RESULT_PATH = "/home/zn/work/steel/app/assets/images/watermarkresult"
SOURCE_PATH = "/home/zn/work/steel/app/assets/images/CssTemplateImages"
LVESEMARK = "/home/zn/work/steel/app/assets/images/lvsemark.png"
ZISEMARK = "/home/zn/work/steel/app/assets/images/zisemark.png"
HONGSEMARK = "/home/zn/work/steel/app/assets/images/hongsemark.png"

Dir::mkdir(RESULT_PATH) unless File.directory? RESULT_PATH

logger = Logger.new("watermark_running.log")

def mark_process(first_image, second_image, position, basename)
  result = first_image.composite(second_image) do |c|
    c.compose "Over"
    c.gravity "SouthEast"
    c.geometry position 
  end
  result.write "#{RESULT_PATH}/#{basename}"
end

# find 会查找子文件夹
Find.find(SOURCE_PATH) do |filename|
  if filename =~ /\.(jpg|png|gif)$/i
    puts filename
    basename = File::basename(filename)
    begin
      first_image  = MiniMagick::Image.open(filename)
      image_width = first_image.width
      if image_width < 450
        second_image = MiniMagick::Image.open(ZISEMARK)
      elsif image_width >= 450 and image_width <= 500
        second_image = MiniMagick::Image.open(HONGSEMARK)
      else
        second_image = MiniMagick::Image.open(LVESEMARK)
      end
      position ="-0-0"
      mark_process(first_image, second_image, position, basename)
      logger.info "watermark  process success: #{basename}"
    rescue Exception => e  
      puts e.message  
      logger.error "watermark process error: #{basename}"
    end
  end
end

