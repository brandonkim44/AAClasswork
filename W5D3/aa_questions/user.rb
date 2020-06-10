require_relative 'question_db_connection'
require_relative 'question'
require_relative 'reply'

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    raise "#{id} not found in DB" unless id
    user = QuestionDBConnection.instance.execute( <<-SQL, id)
        SELECT 
            *
        FROM
            users
        WHERE
            id = ?
    SQL
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionDBConnection.instance.execute( <<-SQL, fname, lname)
    SELECT 
      *
    FROM
      users
    WHERE
      fname = ? AND lname = ?
    SQL
    User.new(user.first)
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def author_replies
    Reply.find_by_user_id(self.id)
  end


  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

def followed_questions
  Question.followed_questions_for_user_id(self.user_id)
end
  
def followers
  Question.followers_for_question_id(self.question_id)
end

end