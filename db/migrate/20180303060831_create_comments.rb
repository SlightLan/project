class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    	t.integer :question_id, null: false, default: 0
    	t.string  :commenter, null: false, default: "commenter@example.com"
    	t.string  :content, null:false, default: "content"
    	t.integer :stars, null:false, default: 0
    	t.string  :reply_to, null: true
    	t.timestamps null: false
    end
  end
end
