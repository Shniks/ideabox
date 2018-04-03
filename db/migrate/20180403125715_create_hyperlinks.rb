class CreateHyperlinks < ActiveRecord::Migration[5.1]
  def change
    create_table :hyperlinks do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true
    end
  end
end
