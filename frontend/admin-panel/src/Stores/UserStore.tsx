import React, { createContext, useContext, useState, ReactNode } from 'react';
import { User } from '@/Interfaces/User';

interface UserContextProps {
  selectedUser: User | null;
  setSelectedUser: (user: User | null) => void;
  users: User[];
  setUsers: (users: User[]) => void;
}

const UserContext = createContext<UserContextProps | undefined>(undefined);

export const UserProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [selectedUser, setSelectedUser] = useState<User | null>(null);
  const [users, setUsers] = useState<User[]>([]);

  return (
    <UserContext.Provider value={{ selectedUser, setSelectedUser, users, setUsers }}>
      {children}
    </UserContext.Provider>
  );
};

// Hook to use the UserContext
export const useUserStore = (): UserContextProps => {
  const context = useContext(UserContext);
  if (!context) {
    throw new Error('useUserStore must be used within a UserProvider');
  }
  return context;
};
