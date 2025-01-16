'use client';
import React, { useState } from 'react';
import Split from 'react-split';
import { VictimList } from '@/Components/VictimList';
import { Terminal } from '@/Components/Terminal';
import { useUserStore } from '@/Stores/UserStore';
import { driver } from 'driver.js';
import 'driver.js/dist/driver.css';
import './App.css';

export default function App() {
  const { selectedUser, setSelectedUser } = useUserStore(); // Access global store
  const [modules, setModules] = useState<Record<string, any>>({});
  const [isTouring, setIsTouring] = useState(false); // Track if the help tour is active

  const startTour = () => {
    const sampleUser = {
      uuid: 'sample-uuid',
      username: 'sampleuser',
      ip: '192.168.1.1',
      machine_name: 'Sample-Machine',
      is_admin: true,
      is_domain_admin: false,
      logged: true,
      port: 0,
      connection_time: [
       { event: 'login', timestamp: '2022-03-01T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-02T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-03T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-04T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-05T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-06T00:00:00Z' },
       { event: 'login', timestamp: '2022-03-07T00:00:00Z' },
      ],
      last_name: '',
      first_name: '',
      domain_name: '',
      latitude: 37.7749,
      longitude: -122.4194,
      city: 'San Francisco',
      region: 'California',
      country: 'US',
    };

    setSelectedUser(sampleUser); // Set sample user for tour
    setIsTouring(true); // Set touring mode

    const steps = [
      {
        element: '#victim-list',
        popover: {
          title: 'Victim List',
          description: 'This is an example of the victim list. Select one to interact with their details.',
          position: 'right',
        },
      },
      {
        element: `#user-details-${sampleUser.uuid}`,
        popover: {
          title: `${sampleUser.machine_name} - Details`,
          description: `
            <ul>
              <li><strong>Username:</strong> ${sampleUser.username}</li>
              <li><strong>IP Address:</strong> ${sampleUser.ip}</li>
              <li><strong>Privileges:</strong> ${
                sampleUser.is_domain_admin
                  ? 'Domain Admin'
                  : sampleUser.is_admin
                  ? 'Admin'
                  : 'User'
              }</li>
            </ul>
          `,
          position: 'right',
        },
      },
      {
        element: '#terminal-input',
        popover: {
          title: 'Terminal Input',
          description: `Type your commands here and press Enter to execute on the targeted victim machine.
          <br/><br/>
          You can type Python code only, or use the <b>/help</b> command to view available modules.
          <br/><br/>
          You can also use the <b>/clear</b> command to clear the terminal.
          <br/><br/>
          You can use <b>Arrow Up</b> and <b>Arrow Down</b> keys to navigate through the command history.
          <br/><br/>
          Try the <b>autocomplete feature</b> by using the /module_name/command_name
          <br/><br/>
          Use <b>/module_name/command_name/help</b> to view the command's documentation.
          <br/><br/>
          Use <b>/help</b> for overall documentation.
          `,
          position: 'top',
        },
      },
      ...(Object.keys(modules).length > 0
        ? Object.keys(modules).map((moduleName) => ({
            element: `#module-btn-${moduleName}`,
            popover: {
              title: `${moduleName.charAt(0).toUpperCase() + moduleName.slice(1)} Module`,
              description:
                modules[moduleName]?.help || `No documentation available for ${moduleName}.`,
              position: 'right',
            },
          }))
        : [
            {
              element: '#button-map',
              popover: {
                title: 'Infection Map',
                description:
                  'This the Infection Map. Click on a marker to select the victim and view it\'s details.',
                position: 'left',
              },
            },
            {
              element: '#button-stats',
              popover: {
                title: 'Infection Stats',
                description:
                  'This is the Infection Stats. View the distribution of infected users based on roles and countries.',
                position: 'left',
              },
            },
            {
              element: '#button-actions',
              popover: {
                title: 'Graphical Actions',
                description:
                  'This is the Graphical Actions. Select a module and a command to execute on the selected victim machine.',
                position: 'left',
              },
            },
            {
              element: '#module-frame',
              popover: {
                title: 'Modules',
                description:
                  'Modules will appear here when a user is selected. Select a victim from the list to view the available modules and their functionality.',
                position: 'left',
              },
            },
          ]),
    ];

    const driverObj = driver({
      animate: true,
      showProgress: true,
      steps,
      onHighlightStarted: (step) => {
        console.log("step", step);
        // Safely access the highlighted element
        const element = step;
        if (element) {
          // Delay the click slightly to ensure highlight rendering is complete
          setTimeout(() => {
            if (element.id === 'button-map') {
              element.click(); // Simulate a click on the Infection Map button
            } else if (element.id === 'button-stats') {
              element.click(); // Simulate a click on the Infection Stats button
            } else if (element.id === 'button-actions') {
              element.click(); // Simulate a click on the Graphical Actions button
            }
          }, 300); // Adjust the delay as needed (300ms works in most cases)
        }
      },
      onDestroyed: () => {
        // Exit touring mode and clear the sample user
        setSelectedUser(null);
        setIsTouring(false);
      },
    });
    driverObj.drive();
  };

  return (
    <div className="h-screen overflow-hidden bg-black text-green-500 font-mono">
      {/* Horizontal Split: VictimList and Main Panel */}
      <Split
        className="flex h-full"
        sizes={[30, 70]} // Initial widths as percentages
        minSize={150}
        gutterSize={10}
        gutterAlign="center"
        direction="horizontal"
      >
        {/* Victim List */}
        <div id="victim-list" className="overflow-auto bg-gray-800">
          <VictimList isTouring={isTouring} />
        </div>

        {/* Terminal */}
        <div className="overflow-auto bg-gray-900">
          {selectedUser ? (
            <Terminal setModules={setModules} />
          ) : (
            <div className="h-full flex items-center justify-center">
              <p>No victim selected. Please select a victim from the list.</p>
            </div>
          )}
        </div>
      </Split>

      {/* Help Button */}
      <button
        onClick={startTour}
        className="fixed bottom-4 left-4 bg-green-600 px-4 py-2 rounded hover:bg-green-400"
      >
        Help
      </button>
    </div>
  );
}
