module ApplicationHelper
  def current_date
    Time.now.strftime("%m.%d.%Y")
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
