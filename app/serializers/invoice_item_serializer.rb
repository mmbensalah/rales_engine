class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id,
             :quantity,
             :unit_price

  belongs_to :item
  belongs_to :invoice
end
