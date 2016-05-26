module LetterAvatar
  module HasAvatar
    extend ActiveSupport::Concern

    def avatar_path(size = 200)
      LetterAvatar.generate(name, size)
    end

    def avatar_url(size = 200)
      avatar_path(size).gsub(/public/, '')
    end
  end
end
