class UserTest < ApplicationRecord
  belong_to :users
  belong_to :tests
end
