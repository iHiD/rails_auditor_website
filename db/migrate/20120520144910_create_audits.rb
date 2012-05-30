class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.belongs_to :project, null: false
      
      t.string :github_repository, null: false
      t.string :github_branch,     null: false
      
      t.string :status, null: false
      #t.integer :trigger_id, null: false

      t.timestamps
    end
    add_foreign_key :audits, :projects, column: :project_id
  end
end
