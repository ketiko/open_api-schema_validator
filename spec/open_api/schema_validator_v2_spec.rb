# frozen_string_literal: true

RSpec.describe OpenApi::SchemaValidator do
  describe '.validate! V2' do
    subject(:validate!) { described_class.validate!(parsed_string) }

    let(:parsed_string) { JSON.parse(input) }

    context 'when spec is valid' do
      let(:input) { File.read('./spec/fixtures/petstore_v2.json') }

      it { is_expected.to be_truthy }
    end

    context 'when spec is invalid' do
      let(:input) { File.read('./spec/fixtures/petstore_v2_invalid.json') }

      it { expect { validate! }.to raise_error(JSON::Schema::ValidationError) }
    end
  end
end
