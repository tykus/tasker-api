require 'test_helper'

class CreatingProjectsTest < ActionDispatch::IntegrationTest

  test 'creates projects' do
    post '/v1/projects.json',
      { project:
        { title: 'Test Project', description: 'Dummy project for test' }
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    project = json(response.body)
    assert_equal api_v1_project_url(project[:id]), response.location
  end

end
