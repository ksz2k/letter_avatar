module LetterAvatar
  module HasAvatar
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
      base.class_eval do
        include LetterAvatar::AvatarHelper
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def self.included(base)
        base.extend ClassMethods
      end

      def avatar_path(size = 64)
        letter_avatar_for(name, size)
      end

      def avatar_url(size = 64)
        letter_avatar_url(name, size)
      end

      def avatar_tag(size = 64, options = {})
        letter_avatar_tag(name, size, options)
      end
      
    end
  end
end
