# encoding: UTF-8
module LetterAvatar::AvatarHelper

  def avatar_for(name, size = 64)
    LetterAvatar.generate(name, size)
  end

  def avatar_url_for(avatar_path)
    avatar_path.to_s.gsub(/public/,'')
  end
  
  def avatar_tag(name, size = 64)
    image_tag(avatar_url_for(avatar_for(name, size)))
  end

end
