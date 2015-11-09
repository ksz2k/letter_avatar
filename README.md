# LetterAvatar

Gem for creating letter avatar from user's name.

Code extracted from discourse source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Examples

![a](https://cloud.githubusercontent.com/assets/5518/11027463/6ae2b738-86f0-11e5-9bbc-4abdbcd957b1.png) ![b](https://cloud.githubusercontent.com/assets/5518/11027570/985d729c-86f1-11e5-9aa5-80907a5d972c.png) ![c](https://cloud.githubusercontent.com/assets/5518/11027459/6add16de-86f0-11e5-8d11-0a767f5e8035.png) ![f](https://cloud.githubusercontent.com/assets/5518/11027569/985b86ee-86f1-11e5-9cdd-26e50d48b687.png) ![e](https://cloud.githubusercontent.com/assets/5518/11027462/6ae06078-86f0-11e5-9bcc-191846431944.png) ![g](https://cloud.githubusercontent.com/assets/5518/11027461/6adffce6-86f0-11e5-8cfe-53e52a2301c8.png) ![h](https://cloud.githubusercontent.com/assets/5518/11027460/6ade0c56-86f0-11e5-9e67-08d53fbe830d.png) ![j](https://cloud.githubusercontent.com/assets/5518/11027457/6a9c9370-86f0-11e5-9fa9-d3d18b3525a6.png) ![l](https://cloud.githubusercontent.com/assets/5518/11027453/6a9955b6-86f0-11e5-84dc-bc2de2cceddf.png) ![m](https://cloud.githubusercontent.com/assets/5518/11027456/6a9c3c4a-86f0-11e5-8571-f66f7aa1ea6c.png) ![n](https://cloud.githubusercontent.com/assets/5518/11027458/6a9d5756-86f0-11e5-9d8a-c2a7c1dbabb3.png) ![p](https://cloud.githubusercontent.com/assets/5518/11027577/a1d25d42-86f1-11e5-8f21-bcf9b1751881.png) ![s](https://cloud.githubusercontent.com/assets/5518/11027455/6a9b91aa-86f0-11e5-8495-4c9627a6f86c.png) ![v](https://cloud.githubusercontent.com/assets/5518/11027454/6a9a016e-86f0-11e5-9d54-14bc02df4c7b.png)

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
