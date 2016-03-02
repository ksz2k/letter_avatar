require "letter_avatar/colors"

module LetterAvatar
  module Configuration

    def cache_base_path
      @cache_base_path
    end

    def cache_base_path=(v)
      @cache_base_path = v
    end

    def colors_palette
      @colors_palette ||= :google
    end

    def colors_palette=(v)
      @colors_palette = v if v.in?(Colors::PALETTES)
    end

    def weight
      @weight ||= 300
    end

    def weight=(v)
      @weight = v
    end

    def svg
      @svg ||= false
    end

    def svg=(v)
      @svg = v
    end

    def annotate_position
      @annotate_position ||= '-0+5'
    end

    def annotate_position=(v)
      @annotate_position = v
    end

  end
end
