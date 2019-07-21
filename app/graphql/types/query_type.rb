require_relative 'example_model_type'

class QueryType < GraphQL::Schema::Object
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :example_models, [Types::ExampleModelType], null: true do; end

  def example_models
    ExampleModel.all
  end
end
