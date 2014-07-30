class CreateBundleTitles < ActiveRecord::Migration
  def change
    create_table :bundle_titles do |t|
      t.integer :bundle_id
      t.integer :title_id

      t.timestamps
    end
  end
end
