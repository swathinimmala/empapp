class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, :options => "ENGINE=MyISAM" do |t|
      t.string :name, :limit => 100
      t.integer :age
      t.string :email_id, :limit => 100
      t.string :location, :limit => 100
      t.string :designation, :limit => 100
      t.string :department, :limit => 100
      t.datetime :soft_deleted_at
      t.timestamps
    end
  end
end
