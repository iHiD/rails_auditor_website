class CreateAuditGems < ActiveRecord::Migration
  def change
    create_table :audit_gems do |t|
      t.references :audit, null: false
      t.references :gem_info, null: false
      
      t.string :name, null: false
      t.string :version, null: true
      t.binary :details, null: false
      
      #t.boolean :specified, null: false
      
      t.timestamps
    end
  end
end
