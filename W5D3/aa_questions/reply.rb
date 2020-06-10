require_relative 'question_db_connection'

class Reply
  attr_accessor :id, :question_id, :user_id, :parent_id, :body

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    raise "#{id} not found in DB" unless id
    reply = QuestionDBConnection.instance.execute( <<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
    SQL
    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

end