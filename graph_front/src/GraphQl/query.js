import { gql } from '@apollo/client';

export const GET_ALL_USERS = gql`
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
`;
