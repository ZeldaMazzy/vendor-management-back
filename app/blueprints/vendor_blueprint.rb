class VendorBluprint < Blueprinter::Base 
  indentifier :id
  fields :name, :age, :gender, :race, :phone, :email 

  view :normal do
    fields :created_at, :updated_at
  end
end