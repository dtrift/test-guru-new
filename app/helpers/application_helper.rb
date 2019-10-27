module ApplicationHelper
  FLASH_TYPES = {
    notice: 'primary',
    alert: 'danger',
    error: 'secondary'
  }.freeze

  def current_date
    Date.current
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_type(type)
    FLASH_TYPES[type.to_sym] || FLASH_TYPES[:notice]
  end
end
