MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The mutation root for this schema'

  field :addAuthor, field: AddAuthorMutation.field
  field :addBlog, field: AddBlogMutation.field
end
