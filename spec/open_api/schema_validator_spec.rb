# frozen_string_literal: true

RSpec.describe OpenApi::SchemaValidator do
  describe 'VERSION' do
    it 'has a version number' do
      expect(OpenApi::SchemaValidator::VERSION).not_to be nil
    end
  end

  describe '.validate!' do
    context 'when json is valid' do
      subject { described_class.validate!(petstore_json) }

      let(:petstore_json) { JSON.parse(petstore_string) }
      let(:petstore_string) { File.read('./spec/fixtures/petstore.json') }

      it { is_expected.to be_truthy }
    end

    context 'when json is invalid' do
      subject(:validate!) { described_class.validate!(invalid_json) }

      let(:invalid_json) { JSON.parse(invalid_string) }
      let(:invalid_string) { File.read('./spec/fixtures/invalid.json') }

      it { expect { validate! }.to raise_error(JSON::Schema::ValidationError) }
    end
  end
end
