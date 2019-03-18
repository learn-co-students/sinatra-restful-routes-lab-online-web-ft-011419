class ChangeCookTime < ActiveRecord::Migration
  def change
    remove_column :recipes, :cook_time
   add_column :recipes, :cook_time, :string
  end
end
