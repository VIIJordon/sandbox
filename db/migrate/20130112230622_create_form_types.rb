class CreateFormTypes < ActiveRecord::Migration
  def change
    create_table :form_types do |t|
      t.string :name
      t.boolean :show
      t.text :brief
      t.datetime :date

      t.timestamps
    end
  end
end
