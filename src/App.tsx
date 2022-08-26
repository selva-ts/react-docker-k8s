import React from 'react';
import logo from './logo.svg';
import './App.css';
import { EnvVariables } from './envVars/envVariables';

const backendApiUrl = EnvVariables.getBackendApiUrl();

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <h1>{backendApiUrl}</h1>
      </header>
    </div>
  );
}

export default App;
