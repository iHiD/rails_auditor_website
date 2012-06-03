class CreateGemInfos < ActiveRecord::Migration
  def change
    create_table :gem_infos do |t|
      t.string :name,    null: false
      t.string :version, null: true
      t.text   :info,    null: true
      
      t.timestamps
      t.datetime :retrieved_at, null: true
    end
  end
end
