import { gql } from '@apollo/client';

export const CREATE_USER_MUTATION = gql`
  mutation createUserMutation($name: String!, $email: String!, $password: String!) {
    createUserMutation(name: $name, email: $email, password: $password) {
      id
      name
      email
      createdAt
    }
  }
`;
