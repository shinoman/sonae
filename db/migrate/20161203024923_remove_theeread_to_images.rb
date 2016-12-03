class RemoveTheereadToImages < ActiveRecord::Migration
  def change
    remove_column :images, :theeread_contents_id, :string
    add_column :images, :thread_contents_id, :string
  end
end
