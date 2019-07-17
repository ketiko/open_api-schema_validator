# frozen_string_literal: true

RSpec.describe OpenApi::SchemaValidator do
  describe '.validate! V3' do
    subject(:validate!) { described_class.validate!(parsed_string, 3) }

    let(:parsed_string) { YAML.safe_load(input) }

    context 'when spec is valid' do
      let(:input) { File.read('./spec/fixtures/petstore_v3.yml') }

      it { is_expected.to be_truthy }
    end

    context 'when spec is invalid' do
      let(:input) { File.read('./spec/fixtures/petstore_v3_invalid.yml') }

      it { expect { validate! }.to raise_error(JSON::Schema::ValidationError) }
    end

    context 'when spec is v2' do
      let(:parsed_string) { JSON.parse(input) }
      let(:input) { File.read('./spec/fixtures/petstore_v2.json') }

      it { expect { validate! }.to raise_error(JSON::Schema::ValidationError) }
    end
  end
end
