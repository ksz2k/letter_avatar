module LetterAvatar
  class Avatar

    # BUMP UP if avatar algorithm changes
    VERSION = 2

    # Largest avatar generated, one day when pixel ratio hit 3
    # we will need to change this
    FULLSIZE = 240

    class<<self

      class Identity
        attr_accessor :color, :letter

        def self.from_username(username)
          identity = new
          identity.color = LetterAvatar::COLORS[
              Digest::MD5.hexdigest(username)[0...15].to_i(16) % LetterAvatar::COLORS.length
          ]
          identity.letter = username[0].upcase

          identity
        end
      end


      def cache_path
        LetterAvatar.cache_path || "public/system/letter_avatars/#{VERSION}"
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

        OptimizedImage.resize(fullsize, filename, size, size)
        filename
      end

      def cached_path(identity, size)
        dir = "#{cache_path}/#{identity.letter}/#{identity.color.join("_")}"
        FileUtils.mkdir_p(dir)

        "#{dir}/#{size}.png"
      end

      def fullsize_path(identity)
        cached_path(identity, FULLSIZE)
      end

      def generate_fullsize(identity)
        color = identity.color
        letter = identity.letter

        filename = fullsize_path(identity)
        stroke = darken(color, 0.8)

        instructions = %W{
          -size 240x240
          xc:#{to_rgb(color)}
          -pointsize 200
          -fill white
          -gravity Center
          -font 'Helvetica'
          -stroke #{to_rgb(stroke)}
          -strokewidth 2
          -annotate -5+25 '#{letter}'
          '#{filename}'
        }

        `convert #{instructions.join(" ")}`

        ImageOptim.new.optimize_image(filename) rescue nil

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
    end
  end
end
