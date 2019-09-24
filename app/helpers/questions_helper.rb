module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    question.new_record? ? "Create new #{test_title} question" : "Edit #{test_title} question"
  end
end
