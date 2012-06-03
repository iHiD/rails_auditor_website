class CreateGemInfos < ActiveRecord::Migration
  def change
    create_table :gem_infos do |t|
      t.string :name,    null: false
      t.string :version, null: false
      t.text   :info,    null: false
      
      t.timestamps
    end
  end
end
