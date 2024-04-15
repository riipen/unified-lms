require 'spec_helper'

RSpec.describe BlackboardClient do
  describe '#get_assignments' do
    it 'returns assignment list from Canvas LMS' do

      let(:course_id) { '_123_1' }
      let(:base_url) { "/api/v1/courses/#{course_id}/content" }
      let(:response) { [{ 'id' => '456', 'title' => 'Introduction' }] }

      before do
        allow(subject).to receive(:get).and_return(response)
      end

      it 'fetches content items for a course using only required parameters' do
        expect(subject).to receive(:get).with(base_url, {})
        subject.get_content_items(course_id: course_id)
      end

      context 'with optional parameters' do
        let(:params) { { limit: 10, offset: 5, recursive: true, title: 'Intro', contentHandler: 'resource/x-bb-document' } }

        it 'fetches content items with all specified parameters' do
          expected_params = { limit: 10, offset: 5, recursive: true, title: 'Intro', contentHandler: 'resource/x-bb-document' }
          expect(subject).to receive(:get).with(base_url, expected_params)
          subject.get_content_items(course_id: course_id, **params)
        end
      end

      context 'with date and reviewable filters' do
        let(:date_params) { { created: '2021-01-01T00:00:00Z', createdCompare: 'greaterOrEqual', modified: '2021-01-02T00:00:00Z', modifiedCompare: 'lessThan', reviewable: true } }

        it 'correctly handles complex filtering based on creation and modification dates' do
          expected_params = { created: '2021-01-01T00:00:00Z', createdCompare: 'greaterOrEqual', modified: '2021-01-02T00:00:00Z', modifiedCompare: 'lessThan', reviewable: true }
          expect(subject).to receive(:get).with(base_url, expected_params)
          subject.get_content_items(course_id: course_id, **date_params)

          end
    end
  end
end