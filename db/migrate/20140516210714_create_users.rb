class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.float :basic_pay
      t.float :pf_deduction
      t.float :hra
      t.float :net_pay
      t.timestamps
    end
  end
end
