class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :sender
      t.string :recipent
      t.string :text
      t.datetime :time_sending
      t.datetime :created_at

      t.timestamps
    end
  end
end
