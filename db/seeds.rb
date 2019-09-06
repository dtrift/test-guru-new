# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([
  {title: 'Frontend'}, {title: 'Backend'}
  ])
tests = Test.create!([
  {title: 'Ruby level 0', category_id: 2},
  {title: 'Rails level 0', category_id: 2},
  {title: 'HTML level 0', category_id: 1},
  {title: 'CSS level 0', category_id: 1},
  {title: 'Ruby level 1', level: 1, category_id: 2},
  {title: 'Rails level 1', level: 1, category_id: 2},
  {title: 'HTML level 1', level: 1, category_id: 1},
  {title: 'CSS level 1', level: 1, category_id: 1},
  {title: 'Ruby level 2', level: 2, category_id: 2},
  {title: 'Rails level 2', level: 2, category_id: 2},
  {title: 'HTML level 2', level: 2, category_id: 1},
  {title: 'CSS level 2', level: 2, category_id: 1}
  ])
users = User.create!([
  {name: 'Bob'},
  {name: 'Tom'},
  {name: 'Tim'}
  ])
questions = Question.create!([
  {body: '1 any question', test_id: 1},
  {body: '2 any question', test_id: 1},
  {body: '3 any question', test_id: 1},
  {body: '4 any question', test_id: 1},
  {body: '5 any question', test_id: 6},
  {body: '6 any question', test_id: 6},
  {body: '7 any question', test_id: 6},
  {body: '8 any question', test_id: 6},
  {body: '9 any question', test_id: 7},
  {body: '10 any question', test_id: 7},
  {body: '11 any question', test_id: 7},
  {body: '12 any question', test_id: 7},
  {body: '13 any question', test_id: 10},
  {body: '14 any question', test_id: 10},
  {body: '15 any question', test_id: 10},
  {body: '16 any question', test_id: 10},
  ])
answers = Answer.create!([
  {body: '1 any answer for 1 question', question_id: 1},
  {body: '2 any answer for 1 question', question_id: 1},
  {body: '3 any answer for 1 question', question_id: 1},
  {body: '4 any answer for 1 question', question_id: 1, correct: true},
  {body: '1 any answer for 2 question', question_id: 2},
  {body: '2 any answer for 2 question', question_id: 2, correct: true},
  {body: '3 any answer for 2 question', question_id: 2},
  {body: '4 any answer for 2 question', question_id: 2},
  {body: '1 any answer for 3 question', question_id: 3},
  {body: '2 any answer for 3 question', question_id: 3},
  {body: '3 any answer for 3 question', question_id: 3, correct: true},
  {body: '4 any answer for 3 question', question_id: 3},
  {body: '1 any answer for 5 question', question_id: 5, correct: true},
  {body: '2 any answer for 5 question', question_id: 5},
  {body: '3 any answer for 5 question', question_id: 5},
  {body: '4 any answer for 5 question', question_id: 5},
  {body: '1 any answer for 6 question', question_id: 6},
  {body: '2 any answer for 6 question', question_id: 6},
  {body: '3 any answer for 6 question', question_id: 6, correct: true},
  {body: '4 any answer for 6 question', question_id: 6},
  {body: '1 any answer for 7 question', question_id: 7},
  {body: '2 any answer for 7 question', question_id: 7},
  {body: '3 any answer for 7 question', question_id: 7},
  {body: '4 any answer for 7 question', question_id: 7, correct: true},
  {body: '1 any answer for 9 question', question_id: 9},
  {body: '2 any answer for 9 question', question_id: 9, correct: true},
  {body: '3 any answer for 9 question', question_id: 9},
  {body: '4 any answer for 9 question', question_id: 9},
  {body: '1 any answer for 10 question', question_id: 10},
  {body: '2 any answer for 10 question', question_id: 10, correct: true},
  {body: '3 any answer for 10 question', question_id: 10},
  {body: '4 any answer for 10 question', question_id: 10},
  {body: '1 any answer for 11 question', question_id: 11},
  {body: '2 any answer for 11 question', question_id: 11},
  {body: '3 any answer for 11 question', question_id: 11, correct: true},
  {body: '4 any answer for 11 question', question_id: 11},
  ])
user_tests = UserTest.create!([
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 2},
  {user_id: 1, test_id: 3},
  {user_id: 1, test_id: 4},
  {user_id: 1, test_id: 5},
  {user_id: 2, test_id: 1},
  {user_id: 2, test_id: 2},
  {user_id: 2, test_id: 3},
  {user_id: 2, test_id: 4},
  {user_id: 2, test_id: 6}
  ])
