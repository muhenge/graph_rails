import React from 'react';
import { useState } from 'react';

const Form = (props) => {
  return (
  <>
    <form >
      <input type="text" name={props.name} placeholder={props.name} value={props.value} />
      <button></button>
    </form>
  </>);
}

export default Form;

