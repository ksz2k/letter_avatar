require "letter_avatar/version"
require "letter_avatar/configuration"
require "letter_avatar/avatar"
require "letter_avatar/avatar_helper"

module LetterAvatar
  extend LetterAvatar::Configuration

  class ExecutionError < StandardError; end

  def self.setup(&block)
    yield(self)
  end

  def self.resize(from, to, width, height)
    begin
      execute(
        # NOTE: ORDER is important!
        %W{
          convert
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
      )
      true
    rescue => e
      false
    end
  end

  def self.generate(username, size)
    Avatar.generate(username, size)
  end

  def self.execute(cmd)
    cmd = cmd.join(' ') if cmd.is_a?(Array)
    if Gem.win_platform?
      require "open3"
      _stdout_str, err = Open3.capture3(cmd.tr("'", '"'))
    else
      pid, _stdin, _stdout, stderr = POSIX::Spawn.popen4(cmd)
      Process.waitpid(pid)
      err = stderr.read
    end
    if err != nil && err.length > 0
      raise ExecutionError.new("letter_avatar execution error (when calling '#{cmd}'): '#{err.strip}'")
    else
      true
    end
  end

end
