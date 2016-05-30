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

      def avatar_path(size = 200)
        LetterAvatar.generate(name, size)
      end

      def avatar_url(size = 200)
        avatar_path(size).gsub(/public/, '')
      end

    end
  end
end
