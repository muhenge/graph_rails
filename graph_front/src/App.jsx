import { ApolloClient, InMemoryCache, ApolloProvider, gql, from, HttpLink } from '@apollo/client';
import {onError} from '@apollo/client/link/error';
import CreateUser from './Components/CreateUser';
import GetUsers from './Components/getUsers';
const errorLink = onError(({ graphQLErrors, networkError }) => {

  if (graphQLErrors)
    graphQLErrors.map(({ message, locations, path }) =>
      console.log(`[GraphQL error]: Message: ${message}, Location: ${locations}, Path: ${path}`,),
    );

  if (networkError) console.log(`[Network error]: ${networkError}`);
});


const link = from([
  errorLink,
  new HttpLink({ uri: 'http://localhost:3000/graphql' }),
])

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: link
});

function App() {
  return (
    <ApolloProvider client={client}>
     <CreateUser />
    </ApolloProvider>
  )
}

export default App
