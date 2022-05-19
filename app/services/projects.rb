module Projects

  def self.new_project(params, current_user)
    project = current_user.projects.new(params)
    return ServiceContract.error("Error saving project") unless project.save
    ServiceContract.success(project)
  end

  def self.update_project(project_id, params, current_user)
    project = current_project.projects.find(project_id)
    return ServiceContract.error("Error updating project") unless project.update(params)
    ServiceContract.success(project)
  end

  def self.destroy_project(project_id, current_user)
    project = current_user.projects.find(project_id)
    ServiceContract.error("Error deleting project") and return unless project.destroy
    ServiceContract.success(payload: nil)
  end
  
end