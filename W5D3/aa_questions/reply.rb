require_relative 'question_db_connection'
require_relative 'user'
require_relative 'question'

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
    question_id_data = QuestionDBConnection.instance.execute( <<-SQL, question_id)
        SELECT 
            *
        FROM
            replies
        WHERE
            question_id = ?
    SQL
    return nil unless replies_instances_arr.length > 0
    replies_instances_arr = question_id_data.map { |datum| Reply.new(datum) }
  end



  def self.find_by_id(id)
    reply = QuestionDBConnection.instance.execute( <<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = ?
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def author        
    user = User.find_by_id(self.user_id)
  end

  def question
    question_instance = Question.find_by_id(self.question_id)
  end

  def parent_reply
    Reply.find_by_id(self.parent_id)
  end

  # Q
  # R1 -> Ra, Rb, Rc
  # R2 -> 
  # R3
  # R4
  def child_replies
    children = QuestionDBConnection.instance.execute( <<-SQL, self.id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_id = ?
    SQL
    children.map { |child| Reply.new(child) }
    return nil unless children.length > 0
  end

end