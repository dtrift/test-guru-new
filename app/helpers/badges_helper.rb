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
    ['Завершение тестов уровня 1', :level_1],
    ['Завершение тестов уровня 2', :level_2],
    ['Завершение тестов уровня 3', :level_3],
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
