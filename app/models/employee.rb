class Employee < ActiveRecord::Base
  attr_accessible :name, :email_id, :department, :designation, :location, :age

  # default scope for selecting active employees
  default_scope where(soft_deleted_at: nil)
  
  # fulltext search word
  def self.search(search_word)
  	Employee.find(:all, :conditions => ["match(name,email_id,location,department,designation) against 
  		(? IN BOOLEAN MODE)", search_word])
  end
  
  #soft deleting an employee or employees
  def soft_delete
  	update_attribute(:soft_deleted_at, Time.now)
  	# ActiveRecord::Base.connection.execute("Update employees set soft_deleted_at=null where id in #{employees};")
  end

end
