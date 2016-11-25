BlogType = GraphQL::ObjectType.define do
  name 'Blog'
  description 'A Blog'
  interfaces [GraphQL::Relay::Node.interface]

  field :id, !types.ID
  field :title, types.String
  field :content, types.String

  connection :author do
    type AuthorType.connection_type

    resolve -> (blog, _, _) {
      blog.author
    }
  end
end
