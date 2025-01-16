import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { UserProvider } from '@/Stores/UserStore';
import App from './App.tsx'
import './index.css'

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <UserProvider>
      <App />
    </UserProvider>
  </StrictMode>,
)
