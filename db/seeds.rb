# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {first_name: 'Bob', email: 'bob@gmail.com', password: '123456'},
  {first_name: 'Tom', email: 'tom@gmail.com', password: '123456'},
  {first_name: 'Tim', last_name: 'G', email: 'tim@gmail.com', password: '123456', type: 'Admin'}
  ])
categories = Category.create!([
  {title: 'Frontend'}, 
  {title: 'Backend'}
  ])
tests = Test.create!([
  {title: 'Ruby level 0', category_id: categories[1].id, user_id: users[0].id},
  {title: 'Rails level 0', category_id: categories[1].id, user_id: users[0].id},
  {title: 'HTML level 0', category_id: categories[0].id, user_id: users[0].id},
  {title: 'CSS level 0', category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby level 1', level: 1, category_id: categories[1].id, user_id: users[0].id},
  {title: 'Rails level 1', level: 1, category_id: categories[1].id, user_id: users[0].id},
  {title: 'HTML level 1', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'CSS level 1', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby level 2', level: 2, category_id: categories[1].id, user_id: users[1].id},
  {title: 'Rails level 2', level: 2, category_id: categories[1].id, user_id: users[1].id},
  {title: 'HTML level 2', level: 2, category_id: categories[0].id, user_id: users[1].id},
  {title: 'CSS level 2', level: 2, category_id: categories[0].id, user_id: users[1].id}
  ])
questions = Question.create!([
  {body: '1 any question for test id 1', test_id: tests[0].id},
  {body: '2 any question for test id 1', test_id: tests[0].id},
  {body: '3 any question for test id 1', test_id: tests[0].id},
  {body: '4 any question for test id 1', test_id: tests[0].id},
  {body: '5 any question for test id 2', test_id: tests[1].id},
  {body: '6 any question for test id 2', test_id: tests[1].id},
  {body: '7 any question for test id 2', test_id: tests[1].id},
  {body: '8 any question for test id 2', test_id: tests[1].id},
  {body: '9 any question for test id 3', test_id: tests[2].id},
  {body: '10 any question for test id 3', test_id: tests[2].id},
  {body: '11 any question for test id 3', test_id: tests[2].id},
  {body: '12 any question for test id 3', test_id: tests[2].id},
  {body: '13 any question for test id 4', test_id: tests[3].id},
  {body: '14 any question for test id 4', test_id: tests[3].id},
  {body: '15 any question for test id 4', test_id: tests[3].id},
  {body: '16 any question for test id 4', test_id: tests[3].id},
  {body: '17 any question for test id 5', test_id: tests[4].id},
  {body: '18 any question for test id 5', test_id: tests[4].id},
  {body: '19 any question for test id 5', test_id: tests[4].id},
  {body: '20 any question for test id 5', test_id: tests[4].id},
  {body: '21 any question for test id 5', test_id: tests[4].id}
  ])
answers = Answer.create!([
  {body: '1 any answer for 1 question', question_id: questions[0].id},
  {body: '2 any answer for 1 question', question_id: questions[0].id},
  {body: '3 any answer for 1 question', question_id: questions[0].id},
  {body: '4 any answer for 1 question c', question_id: questions[0].id, correct: true},
  {body: '1 any answer for 2 question', question_id: questions[1].id},
  {body: '2 any answer for 2 question c', question_id: questions[1].id, correct: true},
  {body: '3 any answer for 2 question', question_id: questions[1].id},
  {body: '4 any answer for 2 question', question_id: questions[1].id},
  {body: '1 any answer for 3 question', question_id: questions[2].id},
  {body: '2 any answer for 3 question', question_id: questions[2].id},
  {body: '3 any answer for 3 question c', question_id: questions[2].id, correct: true},
  {body: '4 any answer for 3 question', question_id: questions[2].id},
  {body: '1 any answer for 4 question c', question_id: questions[3].id, correct: true},
  {body: '2 any answer for 4 question', question_id: questions[3].id},
  {body: '3 any answer for 4 question', question_id: questions[3].id},
  {body: '4 any answer for 4 question', question_id: questions[3].id},
  {body: '1 any answer for 5 question', question_id: questions[4].id},
  {body: '2 any answer for 5 question', question_id: questions[4].id},
  {body: '3 any answer for 5 question c', question_id: questions[4].id, correct: true},
  {body: '4 any answer for 5 question', question_id: questions[4].id},
  {body: '1 any answer for 6 question', question_id: questions[5].id},
  {body: '2 any answer for 6 question', question_id: questions[5].id},
  {body: '3 any answer for 6 question', question_id: questions[5].id},
  {body: '4 any answer for 6 question c', question_id: questions[5].id, correct: true},
  {body: '1 any answer for 7 question', question_id: questions[6].id},
  {body: '2 any answer for 7 question c', question_id: questions[6].id, correct: true},
  {body: '3 any answer for 7 question', question_id: questions[6].id},
  {body: '4 any answer for 7 question', question_id: questions[6].id},
  {body: '1 any answer for 8 question', question_id: questions[7].id},
  {body: '2 any answer for 8 question c', question_id: questions[7].id, correct: true},
  {body: '3 any answer for 8 question', question_id: questions[7].id},
  {body: '4 any answer for 8 question', question_id: questions[7].id},
  {body: '1 any answer for 9 question', question_id: questions[8].id},
  {body: '2 any answer for 9 question', question_id: questions[8].id},
  {body: '3 any answer for 9 question c', question_id: questions[8].id, correct: true},
  {body: '4 any answer for 9 question', question_id: questions[8].id}
  ])
