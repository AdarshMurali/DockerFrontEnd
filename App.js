import React, { useState, useEffect } from 'react';

function App() {
  const [message, setMessage] = useState('');

  useEffect(() => {
    fetch('/api/bye')
      .then((response) => response.text())
      .then((data) => setMessage(data));
  }, []);

  return (
    <div>
      <h1>Frontend UI - React</h1>
      <p>Response from Backend API:</p>
      <p>{message}</p>
    </div>
  );
}

export default App;
