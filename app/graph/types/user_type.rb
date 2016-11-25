UserType = GraphQL::ObjectType.define do
  name 'User'
  description 'User like yourself'

  field :email, types.String

  connection :authors do
    type AuthorType.connection_type

    resolve -> (user, _, _) {
      user.authors
    }
  end

  connection :blogs do
    type BlogType.connection_type

    resolve -> (user, _, _) {
      user.blogs
    }
  end
end
