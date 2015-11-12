module LetterAvatar
  module Colors

    # Colors form Google Inbox
    # https://inbox.google.com
    COLORS = [
      [226, 95, 81], # A
      [242, 96, 145], # B
      [187, 101, 202], # C
      [149, 114, 207], # D
      [120, 132, 205], # E
      [91, 149, 249], # F
      [72, 194, 249], # G
      [69, 208, 226], # H
      [72, 182, 172], # I
      [82, 188, 137], # J
      [155, 206, 95], # K
      [212, 227, 74], # L
      [254, 218, 16], # M
      [247, 192, 0], # N
      [255, 168, 0], # O
      [255, 138, 96], # P
      [194, 194, 194], # Q
      [143, 164, 175], # R
      [162, 136, 126], # S
      [163, 163, 163], # T
      [175, 181, 226], # U
      [179, 155, 221], # V
      [194, 194, 194], # W
      [124, 222, 235], # X
      [188, 170, 164], # Y
      [173, 214, 125] # Z
    ]

    def self.for(username)
      char = username[0].upcase

      if /[A-Z]/.match(char)
        # 65 is 'A' ord
        idx = char.ord - 65
        COLORS[idx]
      elsif /[\d]/.match(char)
        COLORS[char.to_i]
      else
        COLORS[Digest::MD5.hexdigest(username)[0...15].to_i(16) % COLORS.length]
      end
    end

  end
end
