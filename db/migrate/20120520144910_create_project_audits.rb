class CreateProjectAudits < ActiveRecord::Migration
  def change
    create_table :project_audits do |t|
      t.belongs_to :project, null: false

      t.timestamps
    end
    add_index :project_audits, :project_id
  end
end
