class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.belongs_to :project, null: false
      
      t.integer :status_id, null: false
      
      t.binary :configuration, null: true

      t.timestamps
    end
    add_foreign_key :audits, :projects, column: :project_id
  end
end
