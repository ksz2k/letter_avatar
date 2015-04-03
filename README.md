# LetterAvatar

Gem for creating letter avatar from user's name.

Code extracted from discourse source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Installation

System requirements

    sudo apt-get install -y advancecomp gifsicle jhead jpegoptim libjpeg-progs optipng pngcrush pngquant

Add this line to your application's Gemfile:

```ruby
gem 'letter_avatar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install letter_avatar

## Configuration

```ruby
LetterAvatar.setup do |config|
  config.cache_base_path='public/system/lets' # default is 'public/system'
end
```

## Usage

```ruby
LetterAvatar.generate 'ksz2k', 200
=> "public/system/letter_avatars/2/K/87_178_230/200.png"
```

There's also helper for this:

```ruby
include LetterAvatar::AvatarHelper
letter_avatar_for('ksz2k', 200)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
