require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  def self.columns
    return @columns if @columns
    array_of_colnames_and_records = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns = array_of_colnames_and_records[0].map { |column_name| column_name.to_sym }
  end

  def self.finalize!
    self.columns.each do |column_name|
      define_method(column_name) do 
        attributes[column_name]
      end
      define_method("#{column_name}=") do |value| #is a class method itself but makes instance methods
        attributes[column_name] = value #attributes key = column_name, and value is value inside the column
      end
    end
  end

  def self.table_name=(table_name)
      instance_variable_set("@#{self}", "#{table_name.to_s.downcase}s")
  end

  def self.table_name
    "#{self.to_s.downcase}s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
