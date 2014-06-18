class AddIndexes < ActiveRecord::Migration
  def up
  	add_index :employees, :soft_deleted_at
  	execute "CREATE FULLTEXT INDEX fulltext_name ON employees (name)"
  	execute "CREATE FULLTEXT INDEX fulltext_email ON employees (email_id)"
  	execute "CREATE FULLTEXT INDEX fulltext_location ON employees (location)"
  	execute "CREATE FULLTEXT INDEX fulltext_department ON employees (department)"
  	execute "CREATE FULLTEXT INDEX fulltext_designation ON employees (designation)"
  end

  def down
  	remove_index :employees, :soft_deleted_at
  	remove_index :employees, :name
  	remove_index :employees, :email
  	remove_index :employees, :location
  	remove_index :employees, :department
  	remove_index :employees, :designation
  end
end