class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || client_octokit
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    { 
      public: true, 
      description: I18n.t('admin.gists.description', title: @test.title),
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
