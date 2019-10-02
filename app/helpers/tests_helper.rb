module TestsHelper
  TEST_LEVELS = { 0 => :Easy, 1 => :Medium, 2 => :Hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :Ninja
  end

  def test_header(test)
    test_title = test.title
    test.persisted? ? "Edit test: #{test_title}" : "Create new test"
  end
end
