class EmployeesController < ApplicationController
  def index
  	@employees = Employee.all
  end

  def search
  	@employees = Employee.search(params["search_word"])
  end

  def soft_delete
  	if request.post? && params["employees"].present?
  	  @employees = Employee.find(params["employees"])
  	  @employees.each do |employee|
  	    employee.soft_delete
  	  end
  	  redirect_to root_path, notice: "Soft deleted successfully"
  	end
  	@employees = Employee.all
  end

  def sort
  	if params["criterion"].present?
  	  @employees = Employee.order(params["criterion"])
    end
  end

  def group
    if params["criterion"].present? 
      @results = []
      employees = Employee.all
      employees = employees.group_by(&(params["criterion"].to_sym))
      employees.each do |criterion, records|
        @results << {:names => records.collect(&:name), :criterion => criterion}
      end
  	end
  end
end
