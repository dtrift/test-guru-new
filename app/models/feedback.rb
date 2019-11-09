class Feedback
  include ActiveModel::Model

  attr_accessor(
    :user_name,
    :user_email,
    :body
    )

  validates :user_name, :user_email,
            :body, presence: true
end
