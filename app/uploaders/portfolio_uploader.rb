# encoding: utf-8

class PortfolioUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  #include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [600, 400]


  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :main do
    process :resize_to_fit => [600, 400]
  end

  version :thumb do
      process :resize_to_fit => [350, 200]
  end

  #  version :mini do
  #      process :resize_to_fit => [100, nil]
  #      process crop: '100x100+0+0'
  #   end

  #   version :grid do
  #       process :resize_to_fit => [192, 135]
  #       process crop: '192x135+0+0'
  #    end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  private

    # Simplest way
    def crop(geometry)
      manipulate! do |img|      
        img.crop(geometry)
        img
      end    
    end

    # Resize and crop square from Center
    def resize_and_crop(size)  
      manipulate! do |image|                 
        if image[:width] < image[:height]
          remove = ((image[:height] - image[:width])/2).round 
          image.shave("0x#{remove}") 
        elsif image[:width] > image[:height] 
          remove = ((image[:width] - image[:height])/2).round
          image.shave("#{remove}x0")
        end
        image.resize("#{size}x#{size}")
        image
      end
    end

end