import React, {useState} from 'react';
import { useMutation, gql } from '@apollo/client';
import { CREATE_USER_MUTATION } from '../GraphQl/mutations';
import Form from './Form';

const CreateUser = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');

  const [createUser, { data }] = useMutation(CREATE_USER_MUTATION);

  const addUser = (e) => {
    e.preventDefault();
    createUser({ variables: { name: name, email: email, password: password } });
  }

  

  const handleSubmit = (e) => {
    e.preventDefault();
    createUser({ variables: { name, email, password } });
  }

  return (
    <div>
      <h1>Create User</h1>
      <Form
        handleSubmit={handleSubmit}
      />
    </div>
  );
}

export default CreateUser;
