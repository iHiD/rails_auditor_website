class CreateAudits < ActiveRecord::Migration
  def change
    create_table :project_audits do |t|
      t.belongs_to :project, null: false
      
      t.string :github_repository, null: false
      t.string :github_branch,     null: false

      t.timestamps
    end
    add_index :project_audits, :project_id
  end
end
