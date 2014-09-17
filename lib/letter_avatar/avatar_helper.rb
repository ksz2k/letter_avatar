# encoding: UTF-8
module LetterAvatar::AvatarHelper

  def letter_avatar_for(name, size = 64)
    LetterAvatar.generate(name, size)
  end

  def letter_avatar_url_for(avatar_path)
    avatar_path.to_s.gsub(/public/,'')
  end

  def letter_avatar_tag(name, size = 64)
    image_tag(letter_avatar_url_for(letter_avatar_for(name, size)))
  end

end
