AuthorType = GraphQL::ObjectType.define do
  name 'Author'
  description 'Author of Blogs'
  interfaces [GraphQL::Relay::Node.interface]

  field :id, !types.ID
  field :name, types.String

  connection :blogs do
    type BlogType.connection_type

    resolve -> (author, args, _) {
      author.blogs
    }
  end
end
