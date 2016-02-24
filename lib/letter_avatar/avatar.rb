require 'posix/spawn'
require "letter_avatar/colors"
require 'text2path'

module LetterAvatar
  class Avatar

    # BUMP UP if avatar algorithm changes
    VERSION = 2

    # Largest avatar generated, one day when pixel ratio hit 3
    # we will need to change this
    FULLSIZE = 240

    FILL_COLOR = 'rgba(255, 255, 255, 0.65)'.freeze

    FONT_FILENAME = File.join(File.expand_path("../../", File.dirname(__FILE__)), "Roboto-Medium")

    SVG_FONT_FILENAME = "#{FONT_FILENAME}.svg"

    class << self

      class Identity
        attr_accessor :color, :letter

        def self.from_username(username)
          identity = new
          identity.color = LetterAvatar::Colors.for(username)
          identity.letter = username[0].upcase

          identity
        end
      end


      def cache_path
        "#{LetterAvatar.cache_base_path || 'public/system'}/letter_avatars/#{VERSION}"
      end

      def generate(username, size, opts = nil)
        identity = Identity.from_username(username)

        cache = true
        cache = false if opts && opts[:cache] == false

        size = FULLSIZE if size > FULLSIZE
        filename = cached_path(identity, size)

        return filename if cache && File.exists?(filename)

        fullsize = fullsize_path(identity)
        generate_fullsize(identity) if !cache || !File.exists?(fullsize)

        if !LetterAvatar.svg
          LetterAvatar.resize(fullsize, filename, size, size)
        end

        filename
      end

      def cached_path(identity, size)
        dir = "#{cache_path}/#{identity.letter}/#{identity.color.join("_")}"
        FileUtils.mkdir_p(dir)

        LetterAvatar.svg ? "#{dir}/240.svg" : "#{dir}/#{size}.png"
      end

      def fullsize_path(identity)
        cached_path(identity, FULLSIZE)
      end

      def generate_fullsize(identity)
        return generate_svg(identity) if LetterAvatar.svg

        filename = fullsize_path(identity)

        LetterAvatar.execute(
          %W(
            convert
            -size #{FULLSIZE}x#{FULLSIZE}
            xc:#{to_rgb(identity.color)}
            -pointsize 140
            -font #{FONT_FILENAME}
            -weight #{LetterAvatar.weight}
            -fill '#{FILL_COLOR}'
            -gravity Center
            -annotate #{LetterAvatar.annotate_position} '#{identity.letter}'
            '#{filename}'
          ).join(' ')
        )

        filename
      end

      def generate_svg(identity)
        filename = fullsize_path(identity)

        svg_bg = %(<rect id="bg" fill=#{to_rgb(identity.color)} x="0" y="0" width="240" height="240"></rect>)
        text_paths = Text2Path.convert(identity.letter, svg_font, font_size: 170).to_paths
        svg_paths = text_paths.map { |p| svg_path(p) }

        raw = <<-SVG
<?xml version="1.0" standalone="no"?>
<svg width="240px" height="240px" viewBox="0 0 240 240" version="1.1"
  xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  #{svg_bg}
  <svg>
    #{svg_paths.join("\n") }
  </svg>
</svg>
SVG

        File.open(filename, 'w+') do |f|
          f.puts raw
        end

        filename
      end

      def darken(color,pct)
        color.map do |n|
          (n.to_f * pct).to_i
        end
      end

      def to_rgb(color)
        r,g,b = color
        "'rgb(#{r},#{g},#{b})'"
      end

      def svg_font
        return @svg_font if defined? @svg_font
        @svg_font = Text2Path::SvgFont.load SVG_FONT_FILENAME
        @svg_font
      end

      def svg_path(p)
        %Q(<path fill="#{FILL_COLOR}" id="letter" d="#{p.to_command}" />)
      end
    end
  end
end
