require "go_to_mars/version"
require "go_to_mars/converter"

module GoToMars
  class << self
    def land_at(latitude, longitude)
      GoToMars::Converter.instance.convert(latitude, longitude)
    end

    def out_of_empire?(latitude, longitude)
      GoToMars::Converter.instance.need_convert?(latitude, longitude)
    end
  end
end