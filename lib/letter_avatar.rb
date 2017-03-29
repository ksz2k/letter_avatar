require 'open3'

require 'letter_avatar/version'
require 'letter_avatar/configuration'
require 'letter_avatar/avatar'
require 'letter_avatar/avatar_helper'
require 'letter_avatar/colors'

module LetterAvatar
  extend LetterAvatar::Configuration

  class ExecutionError < StandardError; end

  def self.setup(&_block)
    yield(self)
  end

  def self.resize(from, to, width, height)
    execute(
      # NOTE: ORDER is important!
      %W(
        convert
        #{from}
        -background transparent
        -gravity center
        -thumbnail #{width}x#{height}^
        -extent #{width}x#{height}
        -unsharp 2x0.5+0.7+0
        -quality 98
        #{to}
      ).join(' ')
    )
    true
  rescue
    false
  end

  def self.generate(username, size)
    Avatar.generate(username, size)
  end

  def self.execute(cmd)
    cmd = cmd.join(' ') if cmd.is_a?(Array)
    if Gem.win_platform?
      cmd.tr!("'", '"')
    end

    _stdout_str, err = Open3.capture3(cmd)
    if !err.nil? && !err.empty?
      raise ExecutionError.new("letter_avatar execution error (when calling '#{cmd}'): '#{err.strip}'")
    end

    true
  end

  def self.path_to_url(path)
    path.to_s.sub('public/', '/')
  end
end
