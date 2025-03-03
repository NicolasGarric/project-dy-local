class CreateContactRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :email
      t.string :phone_number
      t.text :message
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
