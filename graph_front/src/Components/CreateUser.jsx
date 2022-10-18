import React, {useState} from 'react';
import { useMutation, gql } from '@apollo/client';
import { CREATE_USER_MUTATION } from '../GraphQl/mutations';
import Form from './Form';

const CreateUser = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const [createUserMutation, { error }] = useMutation(CREATE_USER_MUTATION);

  const addUser = (e) => {
    e.preventDefault();
    createUserMutation({ variables: { name: name, authProvider: {credentials:{email,password}} } });
    if(error) {
      console.log(error);
    }
  }

  return (
    <div>
      <h1>Create User</h1>
      <form onSubmit={addUser}>
        <input type="text" name="name" placeholder="name" value={name} onChange={(e) => setName(e.target.value)} />
        <input type="email" name="email" placeholder="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input type="password" name="password" placeholder="password" value={password} onChange={(e) => setPassword(e.target.value)} />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default CreateUser;
