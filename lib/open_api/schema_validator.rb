# frozen_string_literal: true

require 'open_api/schema_validator/version'
require 'json-schema'

module OpenApi
  module SchemaValidator
    def self.validate!(json, version = 2)
      case version
      when 2
        validate_schema!(swagger, json)
      when 3
        validate_schema!(oas3, json)
      end
    end

    def self.validate_schema!(schema, json, opts = {})
      JSON::Validator.add_schema(draft_four_schema)
      JSON::Validator.add_schema(swagger_schema)
      JSON::Validator.add_schema(oas3_schema)
      JSON::Validator.validate!(schema, json, opts)
    end

    def self.oas3
      @oas3 ||= JSON.parse(File.read(oas3_file))
    end

    def self.oas3_file
      File.expand_path('json_schemas/oas_v3_schema.json', __dir__)
    end

    def self.oas3_schema
      @oas3_schema ||= JSON::Schema.new(
        oas3,
        Addressable::URI.parse('https://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/schemas/v3.0/schema.json')
      )
    end

    def self.swagger
      @swagger ||= JSON.parse(File.read(swagger_file))
    end

    def self.swagger_file
      File.expand_path('json_schemas/swagger_schema.json', __dir__)
    end

    def self.swagger_schema
      @swagger_schema ||= JSON::Schema.new(
        swagger,
        Addressable::URI.parse('http://swagger.io/v2/schema#')
      )
    end

    def self.draft_four
      @draft_four ||= JSON.parse(File.read(draft_four_file))
    end

    def self.draft_four_file
      File.expand_path('json_schemas/json_schema_v4.json', __dir__)
    end

    def self.draft_four_schema
      @draft_four_schema ||= JSON::Schema.new(
        draft_four,
        Addressable::URI.parse('http://json-schema.org/draft-04/schema#')
      )
    end
  end
end
