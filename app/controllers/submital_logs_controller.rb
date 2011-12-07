class SubmitalLogsController < ApplicationController
  expose(:project)
  expose(:requirements) { project.requirements }

  def index
    
  end

end
