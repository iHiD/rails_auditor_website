class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      
      t.string :github_repository, null: false
      t.string :github_branch,     null: false

      t.timestamps
    end
  end
end
