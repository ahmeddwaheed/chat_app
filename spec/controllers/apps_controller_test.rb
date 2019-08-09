require 'test_helper'

RSpec.describe 'Users API', type: :request do
  context 'create post' do
    context 'When valid create application' do
      before do
        post "/applications", params: {name: "test"}.to_json
      end

      it 'should returns token' do
        expect(application.token).not_to be_nil
      end

      it 'should returns name' do
        expect(application.name).not_to be_nil
      end

      it 'should returns chats count' do
        expect(application.count).not_to be_nil
      end

      # it 'returns object' do
      #   expect(json['data']['attributes'].keys).to match_array(["insight", "rating", "privacy", "date", "time-since-creation", "current-user-state", "comments-count", "likes-count", "topics", "resources", "comments", "user"])
      # end
    end
  end
end
