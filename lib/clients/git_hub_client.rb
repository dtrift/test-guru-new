class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCES_TOKEN = '80e9af42328c6986b3472cbcffe06132ee33bd8e'.freeze

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCES_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
