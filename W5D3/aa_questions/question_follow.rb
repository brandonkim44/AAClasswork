require_relative 'question_db_connection'
require_relative 'user'
require_relative 'question'

class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.followers_for_question_id(question_id)
      followers = QuestionDBConnection.instance.execute(<<-SQL, question_id
        SELECT
          *
        FROM
          users
        JOIN
          question_follows ON users.id = question_follows.user_id
        WHERE
          question_follows.question_id = ?
      )
      SQL
      followers.map { |follower| User.new(follower) }
  end

  def self.followed_questions_for_user_id(user_id)
    followed_questions = QuestionDBConnection.instance.execute(<<-SQL, user_id
      SELECT
        *
      FROM
        question_follows
      JOIN
        users ON users.id = question_follows.user_id
      WHERE
        users.user_id = ?
    )
    SQL
    followed_questions.map { |followed| Question.new(followed) }
  end

  def self.find_by_id(id)
    raise "#{id} not found in DB" unless id
    question_follow = QuestionDBConnection.instance.execute( <<-SQL, id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?
    SQL
    QuestionFollow.new(question_follow.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

end