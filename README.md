# LetterAvatar

Gem for creating letter avatar from user's name.

Code extracted from discourse source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Examples

![z](https://cloud.githubusercontent.com/assets/5518/11013388/8f0ae550-8546-11e5-97b2-069157fde2ef.png) ![m](https://cloud.githubusercontent.com/assets/5518/11013389/8f0e6d10-8546-11e5-9dd0-a80c0363a9c5.png) ![l](https://cloud.githubusercontent.com/assets/5518/11013390/8f0fad06-8546-11e5-8f65-84a593deb469.png) ![n](https://cloud.githubusercontent.com/assets/5518/11013393/8f50d3da-8546-11e5-8239-ebf33592a074.png) ![g](https://cloud.githubusercontent.com/assets/5518/11013391/8f5013f0-8546-11e5-8f1f-7fd13fbd7f02.png) ![h](https://cloud.githubusercontent.com/assets/5518/11013392/8f509dc0-8546-11e5-9919-b2dc9c35b873.png) ![s](https://cloud.githubusercontent.com/assets/5518/11013394/8f911da0-8546-11e5-92bd-3d33874a67cb.png)

## Installation

System requirements

```bash
$ sudo apt-get install -y imagemagick
```

Mac OS X

```bash
$ brew install imagemagick ghostscript
```

Add this line to your application's Gemfile:

```ruby
gem 'letter_avatar'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install letter_avatar
```

## Configuration

```ruby
LetterAvatar.setup do |config|
  config.cache_base_path = 'public/system/lets' # default is 'public/system'
end
```

## Usage

```ruby
LetterAvatar.generate 'ksz2k', 200
=> "public/system/letter_avatars/2/K/87_178_230/200.png"
```

There's also helper for this. To use it, you need:

* in your helper (eg. `ApplicationHelper`) or controller:

  ```ruby
  include LetterAvatar::AvatarHelper
  ```

* and in your view:

  ```ruby
  letter_avatar_for('ksz2k', 200)
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
