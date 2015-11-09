# LetterAvatar

Gem for creating letter avatar from user's name.

Code extracted from discourse source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Examples

![y](https://cloud.githubusercontent.com/assets/5518/11026688/5de280c0-86e8-11e5-927c-361f3becbf08.png) ![x](https://cloud.githubusercontent.com/assets/5518/11026687/5dddcf08-86e8-11e5-9b94-d691e6b4af9e.png) ![s](https://cloud.githubusercontent.com/assets/5518/11026690/5e2ae2d4-86e8-11e5-938e-b954aa7810f6.png) ![r](https://cloud.githubusercontent.com/assets/5518/11026689/5e292a48-86e8-11e5-9bc5-58b58341203a.png) ![n](https://cloud.githubusercontent.com/assets/5518/11026691/5e73c8f0-86e8-11e5-81ae-9d1ba96f3ea8.png) ![m](https://cloud.githubusercontent.com/assets/5518/11026692/5e73a71c-86e8-11e5-8c3a-752fa606ce98.png) ![l](https://cloud.githubusercontent.com/assets/5518/11026694/5eae94b2-86e8-11e5-9be7-9ac13b1e068e.png) ![j](https://cloud.githubusercontent.com/assets/5518/11026693/5eae0092-86e8-11e5-95e7-c4417e405776.png)


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
