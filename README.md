# README

This is a simple GraphQL API that you can play with. Sign up with and email and password (doesn't need to be real, just unique) to access the GraphiQL editor.

I require you to create an account so that any data you create won't interfere with anyone else, it'll all be tied to your account.

For those unfamiliar with the GraphiQL editor, you can see the schema for the data under the Docs pane at the top right.

Below are examples to help get you started. After you get the hang of things try the following.

1. Create an Author
1. Create another blog on the first author
1. Query for the 2 blogs after the second blog on the first author (HINT: You'll first need to query for the cursor of the second blog)

Congrats! You can use GraphQL, checkout the [spec](https://facebook.github.io/graphql/) to see more about it.

## Queries

Here are some example queries to try.

### Access your data

```graphql
query {
  me {
    email
  }
}
```

### Access the authors on your account

```graphql
query {
  me {
    authors(first: 1) {
      edges {
        node {
          name
        }
      }
    }
  }
}
```

### Access the blogs on an author

```graphql
query {
  me {
    authors(first: 1) {
      edges {
        node {
          blogs(first: 2) {
            edges {
              cursor
              node {
                title
                content
              }
            }
          }
        }
      }
    }
  }
}
```

### Access the blogs on an author after a specified cursor

The cursor field on an edge will be a string you can use to paginate forwards after that edge.

```graphql
query {
  me {
    authors(first: 1) {
      edges {
        node {
          blogs(first: 2, after: "MQ==") {
            edges {
              cursor
              node {
                title
                content
              }
            }
          }
        }
      }
    }
  }
}
```

## Mutations

Here are some example mutations to try.

### Add a blog

```graphql
mutation {
  addBlog(input: { author_id: 1, title: "New Blog", content: "Wahoo!" }) {
    blog {
      id
    }
  }
}
```

## Using variables

#### Query

```graphql
query getBlog($blogID: ID!) {
  blog(id: $blogID) {
    title
    content
  }
}
```

#### Variables

```graphql
{
  "blogID": 1
}
```
