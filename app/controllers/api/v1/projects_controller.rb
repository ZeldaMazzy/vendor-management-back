module Api
  module V1
    class ProjectsController < Api::V1::ApplicationController    

      # POST /api/v1/projects
      def create
        project = @current_user.projects.new(project_params)
        return render_error(errors: "Error saving the project") unless project.save
        result = Projects.new_project(project_params, @current_user)
        render_error(errors: "There was a problem creating a new project", status: 400)
        payload = {
          project: ProjectBlueprint.render_as_hash(result.payload)
        }
        render_success(payload: payload)
      end

      # PATCH/PUT /api/v1/projects/:id
      def update 
        result = Projects.update_project(params[:id], project_params, @current_user)
        render_error(errors: "There was a problem updating the project", status: 400) and return unless result.success?
        payload = {
          project: ProjectBlueprint.render_as_has(result.payload)
        }
        render_success(payload: payload)
      end

      # DESTROY /api/v1/projects:id
      def destroy
         result = Projects.destroy_project(params[:id], @current_user)
         render_error(errors: "There was a problem deleting a project", status: 400) and return unless result.success?
         render_success(payload: nil)
      end
      # GET
      # user projects - get current user projects 
      def my_projects 
        render_success(payload: ProjectBlueprint.render_as_hash(@current_user.projects))
      end

      private
        def project_params
          params.require(:project).permit(:title, :client, :budget, :due_date, :talent_needed, assignment_ids: [])
        end

    end
  end
end

