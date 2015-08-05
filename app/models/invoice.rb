class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :unit
  belongs_to :vat

  before_save :calculate_prices

  validates_presence_of :client, :unit, :vat, :quantity, :unit_price

  def calculate_prices
    self.netto_price ||= self.unit_price * self.quantity
    self.vat_price ||= self.netto_price * self.vat.value * 0.01  # TODO round
    self.brutto_price ||= self.netto_price + self.vat_price
  end

end
