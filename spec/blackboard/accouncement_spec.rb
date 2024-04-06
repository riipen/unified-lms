require 'spec_helper'

RSpec.describe BlackboardClient do
  describe '#get announcements' do
    it 'return announcements list from the blackboard LMS' do
      # Setup
      blackboard_client = BlackboardClient.new
      mock_response = {
        "results": [
          {
            "id": "string",
            "title": "string",
            "body": "<!-- {\"bbMLEditorVersion\":1} --><div data-bbid=\"bbml-editor-id_9c6a9556-80a5-496c-b10d-af2a9ab22d45\"> <h4>Header Large</h4>  <h5>Header Medium</h5>  <h6>Header Small</h6>  <p><strong>Bold&nbsp;</strong><em>Italic&nbsp;<span style=\"text-decoration: underline;\">Italic Underline</span></em></p> <ul>   <li><span style=\"text-decoration: underline;\"><em></em></span>Bullet 1</li>  <li>Bullet 2</li> </ul> <p>  <img src=\"@X@EmbeddedFile.requestUrlStub@X@bbcswebdav/xid-1217_1\">   <span>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span> </p>  <p><span>&lt;braces test=\"values\" other=\"strange things\"&gt;</span></p> <p>Header Small</p> <ol>   <li>Number 1</li>   <li>Number 2</li> </ol>  <p>Just words followed by a formula</p>  <p><img align=\"middle\" alt=\"3 divided by 4 2 root of 7\" class=\"Wirisformula\" src=\"@X@EmbeddedFile.requestUrlStub@X@sessions/EA5F7FF3DF32D271D0E54AF0150D924A/anonymous/wiris/49728c9f5b4091622e2f4d183d857d35.png\" data-mathml=\"«math xmlns=¨http://www.w3.org/1998/Math/MathML¨»«mn»3«/mn»«mo»/«/mo»«mn»4«/mn»«mroot»«mn»7«/mn»«mn»2«/mn»«/mroot»«/math»\"></p> <p><a href=\"http://www.blackboard.com\">Blackboard</a></p> </div>",
            "availability": {
              "duration": {
                "type": "Permanent",
                "start": "2024-03-30T04:55:34.497Z",
                "end": "2024-03-30T04:55:34.497Z"
              }
            },
            "showAtLogin": true,
            "showInCourses": true,
            "created": "2024-03-30T04:55:34.497Z",
            "modified": "2024-03-30T04:55:34.497Z"
          }
        ],
        "paging": {
          "nextPage": "string"
        }
      }

      allow(blackboard_client).to receive(:get_announcement).and_return(mock_response)

      announcements = blackboard_client.get_announcements

      # Verify
      expect(announcements.first['id']).to eq("string")
    end
  end
end