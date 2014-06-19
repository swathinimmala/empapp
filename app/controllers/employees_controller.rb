class EmployeesController < ApplicationController
  PER_PAGE = 5
  def index
  	@employees = Employee.page(params[:page]).per(PER_PAGE)
  end

  def search
  	@employees = Employee.search(params["search_word"])
    @employees = Kaminari.paginate_array(@employees).page(params[:page]).per(PER_PAGE)
  end

  def soft_delete
  	if request.post? && params["employees"].present?
  	  @employees = Employee.find(params["employees"])
  	  @employees.each do |employee|
  	    employee.soft_delete
  	  end
  	  redirect_to root_path, notice: "Soft deleted successfully"
  	end
  	@employees = Employee.page(params[:page]).per(PER_PAGE)
  end

  def sort
  	if params["criterion"].present?
  	  @employees = Employee.order(params["criterion"]).page(params[:page]).per(PER_PAGE)
    end
  end

  def group
    if params["criterion"].present? 
      @results = Employee.grouping(params["criterion"])
      @results = Kaminari.paginate_array(@results).page(params[:page]).per(PER_PAGE)
  	end
  end
end
