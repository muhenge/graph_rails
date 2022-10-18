import React from 'react';
import { useQuery, gql } from '@apollo/client';
import { GET_ALL_USERS } from '../GraphQl/query';
import { useEffect, useState } from 'react';

const GetUsers = () => {
  const { loading, error, data } = useQuery(GET_ALL_USERS);
  const [users, setUsers] = useState([]);
  useEffect(() => {
    if(data) {
      setUsers(data.users);
    }
  }, [data]);
  return (
    <div>
      <h1>Get Users</h1>
      {loading && <p>Loading...</p>}
      {error && <p>Error :(</p>}

      {users && users.length > 0 && users.map(user => {
        return (
          <div key={user.id}>
            <h3>{user.name}</h3>

            {user.transactions && user.transactions.length > 0 && user.transactions.map(transaction => {
                <div key={transaction.id}>
                  <p>{transaction.amount}</p>
                  <p>{transaction.debit}</p>
                  <p>{transaction.credit}</p>
                  <p>{transaction.createdAt}</p>
                </div>

            })}
          </div>

        )
      })}
    </div>
  );
}

export default GetUsers;
