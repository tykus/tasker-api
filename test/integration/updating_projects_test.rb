require 'test_helper'

class UpdatingProjectsTest < ActionDispatch::IntegrationTest

  setup { @project = Project.create!(title: 'Original Title') }

  test 'successful update' do
    patch "/v1/projects/#{@project.id}",
      { project: { title: 'Revised Title' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal 'Revised Title', @project.reload.title
  end

  test 'unsuccessful update' do
    patch "/v1/projects/#{@project.id}",
      { project: { title: 'Short' } }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
  end

end
