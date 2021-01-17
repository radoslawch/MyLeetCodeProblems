=begin
# Definition for Employee.
class Employee
    attr_accessor :id, :importance, :subordinates
    def initialize( id, importance, subordinates)
        @id = id
        @importance = importance
        @subordinates = subordinates
    end
end
=end

# @param {Employee} employees
# @param {Integer} id
# @return {Integer}

def get_importance(employees, id)
  emps = {}
  for e in employees
    emps[e.id] = e
  end
  get_importance_helper(emps, id)
end

def get_importance_helper(emps, id)
  emp = emps[id]
  for sub in emp.subordinates
    emp.importance += get_importance_helper(emps, sub)
  end
  emp.importance
end
