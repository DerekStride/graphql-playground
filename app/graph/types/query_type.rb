QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The query root for this schema'

  field :author do
    type AuthorType
    argument :id, !types.ID
    resolve -> (_, args, ctx) {
      ctx[:user].authors.find(args[:id])
    }
  end

  field :blog do
    type BlogType
    argument :id, !types.ID
    resolve -> (_, args, ctx) {
      ctx[:user].blogs.find(args[:id])
    }
  end

  field :me do
    type UserType
    resolve -> (_, _, ctx) {
      ctx[:user]
    }
  end
end
