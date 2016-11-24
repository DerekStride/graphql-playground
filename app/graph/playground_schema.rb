PlaygroundSchema = GraphQL::Schema.define do
  query QueryType
  resolve_type ->(_, _) { binding.pry }
end
