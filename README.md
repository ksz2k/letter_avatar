# LetterAvatar

Gem for creating letter avatar from user's name (or any other strong / character).

Code extracted from [discourse](https://www.discourse.org/) source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Examples

#### Google's Inbox Palette

<img src="https://cloud.githubusercontent.com/assets/5518/13031513/43eefa76-d30b-11e5-8f06-85f8eb2a4fb6.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031514/43ef6d8a-d30b-11e5-9fbc-38ae526b56b3.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031517/43f0da12-d30b-11e5-8fef-6c7daf235a54.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031515/43f0568c-d30b-11e5-95c5-1653361d4443.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031512/43eebcc8-d30b-11e5-9f95-0093bfadd182.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031516/43f0d0bc-d30b-11e5-8822-f01a6a138ff8.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031519/44382430-d30b-11e5-96e4-bcd7ce5eb155.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031518/44378d04-d30b-11e5-9400-55ff46b94cbe.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031521/443a03cc-d30b-11e5-8467-9592e9dbb2ae.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031523/443badc6-d30b-11e5-9d72-45613018cab4.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031520/44394e14-d30b-11e5-966c-2eada89295c9.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031522/443a71fe-d30b-11e5-88f4-37d1fd220abb.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031525/44752b1e-d30b-11e5-8290-ed8888055e64.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031524/4471cef6-d30b-11e5-9f4c-004f993dd27b.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031526/4475a990-d30b-11e5-8be3-c8f4482dee03.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031527/44772482-d30b-11e5-92f0-b9190c312d70.png" width="60" /> <img src="https://cloud.githubusercontent.com/assets/5518/13031528/447804ce-d30b-11e5-8002-9424d5474ddb.png" width="60" />

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
  config.fill_color        = 'rgba(255, 255, 255, 1)' # default is 'rgba(255, 255, 255, 0.65)'
  config.cache_base_path   = 'public/system/lets'     # default is 'public/system'
  config.colors_palette    = :iwanthue                # default is :google
  config.weight            = 500                      # default is 300
  config.annotate_position = '-0+10'                  # default is -0+5
end
```

#### Color palette

We have two color palettes implemented: `iwanthue` and `google`.

Each of them have different colors, but the `iwanthue` also differently calculates the color for specified username.

The `google` selected will generate the same avatar for both, "Krzysiek" and "ksz2k" usernames given (both of them starts with letter "k"), but `iwanthue` will calculate it's md5 and then selects color, so there's huge chance that these usernames get different colors.

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
  => "public/system/letter_avatars/2/K/87_178_230/200.png"
  # or
  letter_avatar_url('ksz2k', 200)
  => "/system/letter_avatars/2/K/87_178_230/200.png"
  # or even
  letter_avatar_tag('ksz2k', 200, class: 'av')
  => "<img class=\"av\" alt=\"ksz2k\" src=\"/system/letter_avatars/2/K/87_178_230/200.png\" />"
  ```

### Way to support non [a-z0-9] charsets

```rb
class User
  def username_for_avatar
    # Translate Chinese hanzi to pinyin
    # https://github.com/flyerhzm/chinese_pinyin
    Pinyin.t(self.username)
  end
end
```

Then you can get right avatar now:

```rb
letter_avatar_for(user.username_for_avatar, 200)
# or
letter_avatar_tag(user.username_for_avatar, 200, class: 'av')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
