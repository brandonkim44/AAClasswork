require_relative 'question_db_connection'

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

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

end