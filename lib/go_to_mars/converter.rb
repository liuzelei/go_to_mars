require 'singleton'

module GoToMars
  class Converter
    include Singleton

    PI = 3.14159265358979324
    A  = 6378245.0
    EE = 0.00669342162296594323

    def convert(latitude, longitude)
      return [latitude, longitude] if need_convert?(latitude, longitude)
      return offset(latitude, longitude)
    end

    def need_convert?(latitude, longitude)
      longitude < 72.004 || longitude > 137.8347 || latitude < 0.8293 || latitude > 55.8271
    end

    def offset(latitude, longitude)
      rad_latitude = latitude / 180.0 * PI
      magic = Math.sin(rad_latitude)
      magic = 1 - EE * magic * magic
      sqrt_magic = Math.sqrt(magic)
      [latitude + (latitude_offset(latitude, longitude) * 180.0) / ((A * (1 - EE)) / (magic * sqrt_magic) * PI), 
        longitude + (longitude_offset(latitude, longitude) * 180.0) / (A / sqrt_magic * Math.cos(rad_latitude) * PI)]
    end

    def latitude_offset(latitude, longitude)
      x      = longitude - 105.0
      y      = latitude - 35.0
      result = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * Math.sqrt(x.abs)
      result += (20.0  * Math.sin(6.0 * x * PI) + 20.0 * Math.sin(2.0 * x * PI)) * 2.0 / 3.0
      result += (20.0  * Math.sin(y * PI) + 40.0 * Math.sin(y / 3.0 * PI)) * 2.0 / 3.0
      result += (160.0 * Math.sin(y / 12.0 * PI) + 320 * Math.sin(y * PI / 30.0)) * 2.0 / 3.0
      result
    end

    def longitude_offset(latitude, longitude)
      x      = longitude - 105.0
      y      = latitude - 35.0
      result = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * Math.sqrt(x.abs)
      result += (20.0  * Math.sin(6.0 * x * PI) + 20.0 * Math.sin(2.0 * x * PI)) * 2.0 / 3.0
      result += (20.0  * Math.sin(x * PI) + 40.0 * Math.sin(x / 3.0 * PI)) * 2.0 / 3.0
      result += (150.0 * Math.sin(x / 12.0 * PI) + 300.0 * Math.sin(x / 30.0 * PI)) * 2.0 / 3.0
      result
    end
  end
end