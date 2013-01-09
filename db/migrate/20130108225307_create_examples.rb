class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :name
      t.text :brief
      t.boolean :show
      t.datetime :date

      t.timestamps
    end
  end
end
