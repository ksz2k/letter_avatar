module LetterAvatar
  module HasAvatar
    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
    end

    module InstanceMethods
      def self.included(base)
        base.extend ClassMethods
      end

      def avatar_path(size = 64)
        LetterAvatar.generate(name, size)
      end

      def avatar_url(size = 64)
        LetterAvatar.path_to_url(avatar_path(size))
      end

    end
  end
end
