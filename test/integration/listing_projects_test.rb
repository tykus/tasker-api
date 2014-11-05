require 'test_helper'

class ListingProjectsTest < ActionDispatch::IntegrationTest

  test 'returns list of all projects' do
    get '/v1/projects.json'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns a project by id' do
    project = Project.create!(:title => "Test Project")
    get "/v1/projects/#{project.id}.json"
    assert_equal 200, response.status
    project_response = json(response.body)
    assert_equal project.title, project_response[:project][:title]
  end

  test 'returns projects filtered by search query' do
    p1 = Project.create!(:title => "Test Project")
    p2 = Project.create!(:title => "Another Project")
    get "/v1/projects.json?query=another"
    assert_equal 200, response.status
    projects = json(response.body)
    project_titles = projects.collect { |p| p[:project][:title] }
    assert_includes project_titles, 'Another Project'
    refute_includes project_titles, 'Test Project'
  end

  test 'returns projects as JSON' do
    # @TODO: this test is should not use the extension, only the header!
    get '/v1/projects.json', {}, { 'Accepts' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
