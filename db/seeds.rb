# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

client_hash = {name: "The client"}
client = Client.where(client_hash).first
client = Client.new(client_hash) if client.nil?
client.save!

vat_hash = {name: "23%", value: 23}
vat = Vat.where(vat_hash).first
vat = Vat.new(vat_hash) if vat.nil?
vat.save!

unit_hash = {name: "Hour"}
unit = Unit.where(unit_hash).first
unit = Unit.new(unit_hash) if unit.nil?
unit.save!

invoice_hash = {desc: "Sample invoice"}
invoice = Invoice.where(invoice_hash).first
invoice = Invoice.new(invoice_hash) if invoice.nil?
invoice.quantity = 3
invoice.unit_price = 100.0

invoice.vat = vat
invoice.client = client
invoice.unit = unit

invoice.save!