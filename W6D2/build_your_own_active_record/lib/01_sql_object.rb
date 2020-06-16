require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject #is a 'SQL Object' a model or is this a single record? Is each instance a record but the entire class is a Model?
  #parent of class
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

  def self.all #should return all instances of SQL Object
    all_records = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    self.parse_all(all_records)
  end

  def self.parse_all(results)
    results.map { |record| self.new(record) }
  end

  def self.find(id)
    list_of_records = self.all
    list_of_records[id-1]
  end

  def initialize(params = {}) #initializing specific object, taking in options hash
    params.each do |column_name, value|
      raise "unknown attribute '#{column_name.to_sym}'" unless self.class.columns.include?(column_name.to_sym)  #expects setter method to be called but currently not
      self.send("#{column_name.to_sym}=", value)  #more dynamic for future class customization  #expect 0 times vs 1 time, not calling setter method vs calling setter method
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    @attributes.values
  end

  def insert
    self.class.all << self
  end

  def update
    
  end

  def save
    if self.class.all.include?(self)
      self.update
    else
      self.insert
    end
  end
end
