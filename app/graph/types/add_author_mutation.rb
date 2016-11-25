AddAuthorMutation = GraphQL::Relay::Mutation.define do
  name 'AddAuthor'

  input_field :name, !types.String

  return_field :author, AuthorType

  resolve ->(_, inputs, ctx) do
    { author: ctx[:user].authors.create!(name: inputs[:name]) }
  end
end
