class CreateCoverages < ActiveRecord::Migration[5.2]
  def change
    create_table :coverages do |t|
      t.string :coverage_type
      t.float :coverage_limit
      t.references :policy, foreign_key: true
      t.timestamps
    end
  end
end
