class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :netto_price
      t.decimal :brutto_price
      t.decimal :vat_price
      t.text :desc

      t.references :client
      t.references :unit
      t.references :vat

      t.timestamps
    end
  end
end
