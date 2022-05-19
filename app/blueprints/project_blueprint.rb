class ProjectBlueprint < Blueprinter::Base
  identifier :id
  fields :title, :client, :budget, :due_date, :talent_needed

  view :normal do
    fields :created_at, :updated_at
  end

end