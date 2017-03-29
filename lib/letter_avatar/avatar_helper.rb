module LetterAvatar
  module AvatarHelper
    def letter_avatar_for(name, size = 64)
      LetterAvatar.generate(name, size)
    end

    def letter_avatar_url_for(avatar_path)
      LetterAvatar.path_to_url(avatar_path)
    end

    def letter_avatar_url(name, size = 64)
      letter_avatar_url_for(letter_avatar_for(name, size))
    end

    def letter_avatar_tag(name, size = 64, options = {})
      if defined?(ActionView::Helpers::AssetTagHelper)
        extend ActionView::Helpers::AssetTagHelper
        image_tag(letter_avatar_url(name, size), options.merge(alt: name))
      else
        "<img alt=\"#{name}\" class\"#{options.fetch(:class)}\" src=\"#{letter_avatar_url(name, size)}\" />"
      end
    end
  end
end
