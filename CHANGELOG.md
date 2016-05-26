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
