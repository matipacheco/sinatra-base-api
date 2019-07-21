require_relative 'types/query_type'
require_relative 'types/mutation_type'

class ApiSchema < GraphQL::Schema
  query(QueryType)
end
