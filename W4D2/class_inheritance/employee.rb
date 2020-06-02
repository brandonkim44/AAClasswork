class Employee
    attr_reader :name, :boss, :salary
    attr_writer :title
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.employees << self unless @boss.nil?
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end