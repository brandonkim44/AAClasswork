require_relative 'question_db_connection'

class QuestionFollow
  attr_accessor :id, :question_id, :user_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
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