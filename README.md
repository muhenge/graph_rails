# Documentation
> This doc is a graphql samples

## How to run

```bash
$ git clone https://github.com/muhenge/graph_rails.git
$ cd graph_rails
$ bundle install
$ bundle exec figaro install
```
configure your database in `config/database.yml` and `config/application.yml`

```bash
$ rake db:migrate
$ rails s
```
go to `http://localhost:3000/graphiql` to run your queries

## How to run

> Display all users

```graphql
query {
  users {
    id
    name
    createdAt
    transactions {
      id
      amount
      debit
      credit
      createdAt
    }
  }
}
```

> User by ID

```graphql
query {
  user(id: 1) {
    id
    name

    transactions {
      id
      amount
      debit
      credit
      createdAt
    }
  }
```

> Create user mutation

```graphql

 mutation {
   createUserMutation(
     input: {
       name:"test"
       authProvider: {
         credentials:{
           email:"test@g.com"
           password: "123456"
         }
       }
     }
   ) {
     id
     email
     name
     createdAt
   }
 }
```

> Login User mutation


```graphql
 mutation {
   signInMutation(
     input: {
       credentials:{
         email: "afff@example.com"
        password:"123456"
       }
     }
   ) {
     user{
       id
      email
       createdAt
       transactions {
         id
         amount
       }
     }
     token
  }
 }

```

---



###### Transactions

> Create transactions



```graphql
mutation {
  createTransactionMutation(input:{
    credit: 370000
    debit: 0
  }) {
		id
    amount
    createdAt
    createdBy {
      name
    }
  }
}
```

> all Transactions


```graphql
{
  transactions {
    id
    amount
    createdAt
    createdBy {
      id
      name
    }
  }
}
```
