class CreateBankrolls < ActiveRecord::Migration
  def change
    create_table :bankrolls do |t|
      t.string :purchase
      t.text :brief
      t.datetime :date_purchased
      t.string :card
      t.boolean :rosemary
      t.boolean :jordon

      t.timestamps
    end
  end
end
