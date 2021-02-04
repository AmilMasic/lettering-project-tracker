class ToolsController < ApplicationController

    def show
        @tool = Tool.find_by(id: params[:id])
    end

    def index
        @tools = Tool.all
    end

    def new
        @pt = ProjectsTool.new
        @tool = Tool.new
        # binding.pry
        # @pt = ProjectTool.create(project_id: params[:project_id])
    end

    def create
        @tool = Tool.create(tool_params)
        binding.pry
        @pt = ProjectsTool.find_by(tool_id: "")
        @pt.tool_id = @tool.id
        @pt.save
            # create project tools child here
        redirect_to projects_path
       
    end

    private

    def tool_params
        params.require(:tool).permit(:brand, :name)
    end


end
