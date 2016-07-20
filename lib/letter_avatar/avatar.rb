module LetterAvatar
  class Avatar
    # BUMP UP if avatar algorithm changes
    VERSION = 2

    # Largest avatar generated, one day when pixel ratio hit 3
    # we will need to change this
    FULLSIZE = 240

    FILL_COLOR = 'rgba(255, 255, 255, 0.65)'.freeze

    FONT_FILENAME = File.join(File.expand_path('../../', File.dirname(__FILE__)), 'Roboto-Medium')

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

        return filename if cache && File.exist?(filename)

        fullsize = fullsize_path(identity)
        generate_fullsize(identity) if !cache || !File.exist?(fullsize)

        LetterAvatar.resize(fullsize, filename, size, size)
        filename
      end

      def cached_path(identity, size)
        dir = "#{cache_path}/#{identity.letter}/#{identity.color.join('_')}"
        FileUtils.mkdir_p(dir)

        "#{dir}/#{size}.png"
      end

      def fullsize_path(identity)
        cached_path(identity, FULLSIZE)
      end

      def generate_fullsize(identity)
        filename = fullsize_path(identity)

        LetterAvatar.execute(
          %W(
            convert
            -size #{FULLSIZE}x#{FULLSIZE}
            xc:#{to_rgb(identity.color)}
            -pointsize 140
            -font #{FONT_FILENAME}
            -weight #{LetterAvatar.weight}
            -fill '#{LetterAvatar.fill_color || FILL_COLOR}'
            -gravity Center
            -annotate #{LetterAvatar.annotate_position} '#{identity.letter}'
            '#{filename}'
          ).join(' ')
        )

        filename
      end

      def darken(color, pct)
        color.map do |n|
          (n.to_f * pct).to_i
        end
      end

      def to_rgb(color)
        r, g, b = color
        "'rgb(#{r},#{g},#{b})'"
      end
    end
  end
end
