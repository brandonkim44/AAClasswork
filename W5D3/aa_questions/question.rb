require_relative 'question_db_connection'

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
    data = QuestionDBConnection.instance.execute()
  end

end