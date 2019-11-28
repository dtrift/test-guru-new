module BadgesHelper
  PICTURES = [
    '/images/badge_pics/level-1.png',
    '/images/badge_pics/level-2.png',
    '/images/badge_pics/level-3.png',
    '/images/badge_pics/badge.png',
    '/images/badge_pics/badge-star.png',
    '/images/badge_pics/diplom.png'
  ].freeze

  def pictures
    PICTURES
  end

  def rules
    Badge::RULES
  end
end
