class VendorBlueprint < Blueprinter::Base 
  identifier :id
  fields :name, :age, :gender, :race, :phone, :email, :height, :weight, :dayrate, :image_path, :user_id, :created_at, :updated_at

  view :normal do
    fields :name, :age, :gender, :race, :phone, :email, :height, :weight, :dayrate, :image_path, :created_at, :updated_at
  end
end