class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string  :title,    null: false,   default: "Question title"
      t.string  :content,  null: false,   default: "Question content"
      t.string  :asker,    null: false,   default: "Question asker"
      t.integer :stars,    null: false,   default: 0


      t.timestamps
    end
  end
end
