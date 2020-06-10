require_relative 'question_db_connection'
require_relative 'user'
require_relative 'reply'

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    raise "#{id} not found in DB" unless id
    question = QuestionDBConnection.instance.execute( <<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
    SQL
    Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_author_id(author_id)
    raise "#{author_id} not found in DB" unless author_id
    author_id_data = QuestionDBConnection.instance.execute(<<-SQL, author_id)
    SELECT
        *
    FROM
        questions
    WHERE
        author_id = ?
    SQL
    Question.new(author_id_data.first)
  end

  def author
    User.find_by_id(self.author_id)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

end