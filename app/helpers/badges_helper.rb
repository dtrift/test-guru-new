module BadgesHelper
  PICTURES = [
    '/images/badge_pics/level-1.png',
    '/images/badge_pics/level-2.png',
    '/images/badge_pics/level-3.png',
    '/images/badge_pics/badge.png',
    '/images/badge_pics/badge-star.png',
    '/images/badge_pics/diplom.png'
  ].freeze

  RULES = [
    ['Завершение тестов уровня Easy', :easy],
    ['Завершение тестов уровня Medium', :medium],
    ['Завершение тестов уровня Hard', :hard],
    ['Завершение теста с первой попытки', :first_try],
    ['Завершение тестов категории Backend', :category_backend]
  ].freeze

  def pictures
    PICTURES
  end

  def rules
    RULES
  end
end
