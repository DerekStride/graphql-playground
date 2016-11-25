PlaygroundSchema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType

  resolve_type ->(_, _) { binding.pry }
end
