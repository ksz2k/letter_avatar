require "letter_avatar/colors"

module LetterAvatar
  module Configuration

    def cache_base_path
      Thread.current[:cache_base_path]
    end

    def cache_base_path=(v)
      Thread.current[:cache_base_path] = v
    end

    def colors_palette
      Thread.current[:colors_palette] ||= :google
    end

    def colors_palette=(v)
      Thread.current[:colors_palette] = v if v.in?(Colors::PALETTES)
    end

    def weight
      Thread.current[:weight] ||= 300
    end

    def weight=(v)
      Thread.current[:weight] = v
    end

    def annotate_position
      Thread.current[:annotate_position] ||= '-0+5'
    end

    def annotate_position=(v)
      Thread.current[:annotate_position] = v
    end

  end
end
