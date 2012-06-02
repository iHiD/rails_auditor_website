class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.belongs_to :project, null: false
      
      t.integer :status_id, null: false
      #t.integer :trigger_id, null: false

      t.timestamps
    end
    add_foreign_key :audits, :projects, column: :project_id
  end
end
