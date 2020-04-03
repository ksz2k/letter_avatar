0.3.8
-----

- added `LetterAvatar.font` config option.

0.3.7
-----

- added `LetterAvatar.custom_palette` config option.
- bumped `FULLSIZE` to 600.

0.3.6
-----

- added `LetterAvatar.letters_count` config option.
- added `LetterAvatar.pointsize` config option.

0.3.5
-----

- `LetterAvatar::HasAvatar` helper module cleanup
- `LetterAvatar.path_to_url` helper method

0.3.4
-----

- enhanced `LetterAvatar::HasAvatar` helper module

0.3.3
-----

- removed `-interpolate` imagemagick option - it's removed in IMv7

0.3.2
-----

- extend objects with `ActionView::Helpers::AssetTagHelper`

0.3.1
-----

- added `LetterAvatar.fill_color` config option.

0.3.0
-----

- Removed `activesupport` dependency.

0.2.0
-----

- Removed `posix-spawn` dependency, Open3 speed is ok.

0.1.11
------

- Windows support.

0.1.10
------

- `LetterAvatar::AvatarHelper` module tweaks
  - `letter_avatar_url` method, returning avatar proper url
  - `letter_avatar_tag` doeas not require `ActionView::Helpers::AssetTagHelper`

0.1.9
-----

- `LetterAvatar::Configuration` module, `mattr_accessor` (depending on `ActiveSupport`) removed

  fixes [#7](https://github.com/ksz2k/letter_avatar/issues/7)

0.1.5
-----

- Use [posix-spawn](https://github.com/rtomayko/posix-spawn) to instead of Kernel#exec to get better performance.

  > fork(2) calls slow down as the parent process uses more memory due to the need to copy page tables.
