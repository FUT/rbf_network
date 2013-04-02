require 'chunky_png'

class Noise

  class << self
    def random_pixel(png)
      [rand(png.dimension.width), rand(png.dimension.height)]
    end

    def invert_random(png)
      coordinates = random_pixel png
      png[*coordinates] = ChunkyPNG::Color(png[*coordinates] < 1000 ? 'white' : 'black')
    end

    def apply(noise_pixels)
      # Move pattern files
      system 'rm recognize/*.png'
      system 'cp patterns/*.png recognize/'

      # Add noize to each file
      Dir['recognize/*.png'].each_with_index do |file, i|
        png = ChunkyPNG::Image.from_file(file)

        noise_pixels.times { invert_random png }

        png.save file.gsub(/\/.*\.png/, "/#{i}.png")
        File.delete file
      end
    end
  end

end
