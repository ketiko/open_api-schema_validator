# frozen_string_literal: true

RSpec.describe OpenApi::SchemaValidator do
  describe 'VERSION' do
    it 'has a version number' do
      expect(OpenApi::SchemaValidator::VERSION).not_to be nil
    end
  end
end
