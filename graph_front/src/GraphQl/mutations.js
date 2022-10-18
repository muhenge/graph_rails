import { gql } from '@apollo/client';

export const CREATE_USER_MUTATION = gql`
  mutation($name: String!, $email: String!, $password: String!) {
    createUserMutation( input: { name: $name, authProvider: { credentials: { email: $email, password: $password}}}) {
      id
      email
      name
      createdAt
    }
  }
`;

