class GistQuestionService
  def initialize(question, client: client_octokit)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def gist_url
    @client.last_response.data[:html_url]
  end

  def success?
    @client.last_response.data[:html_url].present?
  end

  # def success?
  #   gist_url.present?
  # end

  private

  def gist_params
    { 
      public: true, 
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def client_octokit
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
