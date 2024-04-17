require 'rspec'
require 'webmock/rspec'
require_relative 'course.rb'

describe 'get_courses' do
  before do
    stub_request(:get, "https://your.canvas.instance.com/api/v1/courses")
      .with(query: hash_including({}))
      .to_return(status: 200, body: '[]', headers: {'Content-Type' => 'application/json'})
  end

  it 'calls the Canvas API with the correct endpoint' do
    get_courses
    expect(WebMock).to have_requested(:get, "https://your.canvas.instance.com/api/v1/courses").once
  end

  it 'passes query parameters to the API' do
    get_courses(enrollment_type: 'teacher')
    expect(WebMock).to have_requested(:get, "https://your.canvas.instance.com/api/v1/courses")
                         .with(query: hash_including(enrollment_type: 'teacher'))
  end

  it 'handles multiple query parameters correctly' do
    get_courses(state: 'available', include: ['syllabus_body', 'term'])
    expect(WebMock).to have_requested(:get, "https://your.canvas.instance.com/api/v1/courses")
                         .with(query: hash_including(state: 'available', 'include[]' => 'syllabus_body', 'include[]' => 'term'))
  end

  it 'returns the correct response from the API' do
    response = get_courses
    expect(response).to eq('[]')
  end

  context 'when the API returns an error' do
    before do
      stub_request(:get, "https://your.canvas.instance.com/api/v1/courses")
        .to_return(status: 500, body: '{"error":"Internal Server Error"}', headers: {'Content-Type' => 'application/json'})
    end

    it 'handles HTTP errors gracefully' do
      expect { get_courses }.not_to raise_error
    end
  end
end