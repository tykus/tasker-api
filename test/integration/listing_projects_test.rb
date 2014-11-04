require 'test_helper'

class ListingProjectsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com' }

  test 'returns list of all projects' do
    get '/v1/projects.json'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns a project by id' do
    project = Project.create!(:title => "Test Project")
    get "/v1/projects/#{project.id}.json"
    assert_equal 200, response.status
    project_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal project.title, project_response[:project][:title]
  end

  test 'returns projects filtered by search query' do
    p1 = Project.create!(:title => "Test Project")
    p2 = Project.create!(:title => "Another Project")
    get "/v1/projects.json?query=another"
    assert_equal 200, response.status
    projects = JSON.parse(response.body, symbolize_names: true)
    project_titles = projects.collect { |p| p[:project][:title] }
    assert_includes project_titles, 'Another Project'
    refute_includes project_titles, 'Test Project'
  end
end
