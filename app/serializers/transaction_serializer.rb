class TransactionSerializer < ActiveModel::Serializer
  attributes :id,
             :result

  belongs_to :invoice
end
