module EmployeesHelper
  def option_generator
  	words = ["id", "created_at", "updated_at", "soft_deleted_at"]
  	Employee.column_names.reject {|c| words.include?(c)}
  end
end
