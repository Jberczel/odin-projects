class SorceryCore < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      #t.string :username,		  :null => false
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.timestamps
    end

    add_index :authors, :email, unique: true
  end
end
