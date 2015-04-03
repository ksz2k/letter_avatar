require "letter_avatar/version"
require "letter_avatar/avatar"

module LetterAvatar

  mattr_accessor :cache_base_path
  @@cache_base_path = nil

  def self.setup(&block)
    yield(self)
  end

  def self.resize(from, to, width, height)
    # NOTE: ORDER is important!
    instructions = %W{
      #{from}
      -background transparent
      -gravity center
      -thumbnail #{width}x#{height}^
      -extent #{width}x#{height}
      -interpolate bicubic
      -unsharp 2x0.5+0.7+0
      -quality 98
      #{to}
    }.join(" ")

    `convert #{instructions}`

    if $?.exitstatus == 0
      ImageOptim.new.optimize_image(to) rescue nil
      true
    else
      false
    end
  end

  def self.generate(username, size)
    Avatar.generate(username, size)
  end

end
