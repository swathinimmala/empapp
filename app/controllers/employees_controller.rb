class EmployeesController < ApplicationController
  def index
  	@employees = Employee.all
  end

  def search
  	@employees = Employee.search(params["search_word"])
  end

  def soft_delete
  	if request.post?
  	  @employees = Employee.find(params["employees"])
  	  @employees.each do |employee|
  	    employee.soft_delete
  	  end
  	  redirect_to root_path, notice: "Soft deleted successfully"
  	end
  	@employees = Employee.all
  end

  def sort
  	if params["operation"].present? && params["criterion"].present?
  	  @employees = Employee.send(params["operation"], params["criterion"])
  	end
  end
end
