require_relative './employee'
require "byebug"
class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        employee_salaries * multiplier
    end

    def employee_salaries
        sum = 0
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                sum += employee.employee_salaries + employee.salary
            else
                sum += employee.salary
            end
        end
        
        sum
    end

end