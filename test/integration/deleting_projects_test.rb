require 'test_helper'

class DeletingProjectsTest < ActionDispatch::IntegrationTest
  setup { @project = Project.create!(title: "Delete This Project") }

  test 'deletes existing project' do
    delete "/v1/projects/#{@project.id}"
    assert_equal 204, response.status
  end

end
