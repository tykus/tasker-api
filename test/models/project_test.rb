require 'test_helper'
require 'project'

class ProjectTest < ActiveSupport::TestCase

  @project = Project.new

  test "it should have a title" do
    @project.title.should_not == nil
  end

end
