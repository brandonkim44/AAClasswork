require_relative 'question_db_connection'

class Reply
  attr_accessor :id, :question_id, :user_id, :parent_id, :body

  def self.all
    data = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_user_id(user_id)
    raise "#{user_id} not found in DB" unless user_id
    user_id_data = QuestionDBConnection.instance.execute( <<-SQL, user_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            user_id = ?
    SQL
    Reply.new(user_id_data.first)
  end


  def self.find_by_question_id(question_id)
    raise "#{question_id} not found in DB" unless question_id
    question_id_data = QuestionDBConnection.instance.execute( <<-SQL, question_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            question_id = ?
    SQL
    question_id_data.map { |datum| Reply.new(datum) }
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

  def author          #????????????
    user = User.find_by_id(self.user_id)
    user.fname + " " + user.lname
  end

  def question
    question_instance = Question.find_by_id(self.question_id)
    question_instance.body     #????????
  end

  def parent_reply #are we returning the body of the parent reply or the instance of that parent reply?
    #10 replies on a question and there is a parent reply at the very top
    # 2 cases: it IS the parent reply or it's not, and if not must find it
    Reply.find_by_id(self.parent_id) #or .body to return body
  end



end