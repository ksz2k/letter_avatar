# LetterAvatar

Gem for creating letter avatar from user's name.

Code extracted from discourse source (thanks guys!) - I needed this functionality in three projects, so here's the gem! :-)

[![Code Climate](https://codeclimate.com/github/ksz2k/letter_avatar/badges/gpa.svg)](https://codeclimate.com/github/ksz2k/letter_avatar)

## Examples

#### Google's Inbox Palette

![a](https://cloud.githubusercontent.com/assets/5518/11028712/fb4ceb8a-86fb-11e5-8a94-c75eaf46b089.png) ![b](https://cloud.githubusercontent.com/assets/5518/11028713/fb55fc5c-86fb-11e5-9a67-a4e84ee618be.png) ![c](https://cloud.githubusercontent.com/assets/5518/11028715/fb5a8178-86fb-11e5-9312-9cc990b1a94f.png) ![d](https://cloud.githubusercontent.com/assets/5518/11028714/fb567f88-86fb-11e5-8e99-b14602321f69.png) ![e](https://cloud.githubusercontent.com/assets/5518/11028716/fb61d194-86fb-11e5-8bab-bc69cad905cc.png) ![f](https://cloud.githubusercontent.com/assets/5518/11028717/fb656d54-86fb-11e5-810a-f8a3847c0da8.png) ![g](https://cloud.githubusercontent.com/assets/5518/11028718/fb862e7c-86fb-11e5-8b46-42a64fb15f46.png) ![h](https://cloud.githubusercontent.com/assets/5518/11028719/fb8f1910-86fb-11e5-9794-433a9490b15a.png) ![j](https://cloud.githubusercontent.com/assets/5518/11028720/fb8f200e-86fb-11e5-8b20-476745abfe21.png) ![l](https://cloud.githubusercontent.com/assets/5518/11028721/fb923654-86fb-11e5-961c-92be1aaedef8.png) ![m](https://cloud.githubusercontent.com/assets/5518/11028722/fb9e68b6-86fb-11e5-8ba6-4e8ece3a9d89.png) ![n](https://cloud.githubusercontent.com/assets/5518/11028723/fba26826-86fb-11e5-9611-bde4bc7d84ed.png) ![p](https://cloud.githubusercontent.com/assets/5518/11028724/fbc4d9ec-86fb-11e5-85f3-0e0b46bbc9a1.png) ![s](https://cloud.githubusercontent.com/assets/5518/11028725/fbc5d464-86fb-11e5-937e-de11c747b70d.png)

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
  config.colors_palette = :iwanthue             # default is :google
end
```

#### Color palette

We have two color palettes implemented: `iwanthue` and `google`.

Each of them have different colors, but the `iwanthue` also differently calculates the color for specyfied username.

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
# or even
letter_avatar_tag('ksz2k', 200, class: 'av')
  ```

### Way to support non [a-z0-9] charsets

```rb
class User
  def username_for_avatar
    # Translate chinese hanzi to pinyin
    # https://github.com/flyerhzm/chinese_pinyin
    Pinyin.t(self.username)
  end
end
```

Then you can get right avatar now:

```rb
letter_avatar_for(user.username_for_avatar, 200)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
