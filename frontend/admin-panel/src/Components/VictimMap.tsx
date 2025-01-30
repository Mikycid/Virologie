import React, { useState } from 'react';
import { Map, Marker, Overlay } from 'pigeon-maps';
import { useUserStore } from '@/Stores/UserStore';
import Measure from 'react-measure';

interface VictimMapProps {
  defaultCenter: [number, number];
}

const VictimMap: React.FC<VictimMapProps> = ({ defaultCenter }) => {
  const { users, selectedUser, setSelectedUser } = useUserStore();
  const [dimensions, setDimensions] = useState({ width: 0, height: 0 });
  const [popupInfo, setPopupInfo] = useState<{
    machines: Array<{
      uuid: string;
      domain_name: string;
      ip: string;
      port: number;
      is_admin: boolean;
      username: string;
      machine_name: string;
    }>;
    position: [number, number] | null;
    selectedMachine: number | null;
  }>({ machines: [], position: null, selectedMachine: null });

  // Group users by their coordinates
  const groupedPositions = users.reduce((acc, user) => {
    if (
      user.latitude !== null &&
      user.longitude !== null &&
      !isNaN(user.latitude!) &&
      !isNaN(user.longitude!)
    ) {
      const key = `${user.longitude},${user.latitude}`;
      if (!acc[key]) {
        acc[key] = [];
      }
      acc[key].push(user);
    }
    return acc;
  }, {} as Record<string, typeof users>);

  const handleMarkerClick = (machines: typeof users, position: [number, number]) => {
    setPopupInfo({
      machines: machines.map(machine => ({
        uuid: machine.uuid,
        domain_name: machine.domain_name,
        ip: machine.ip,
        port: machine.port,
        is_admin: machine.is_admin,
        username: machine.username,
        machine_name: machine.machine_name,
      })),
      position,
      selectedMachine: null,
    });
  };

  const handleMachineSelect = (index: number) => {
    setPopupInfo(prev => ({ ...prev, selectedMachine: index }));
    const selectedMachine = popupInfo.machines[index];
    const user = users.find(user => user.uuid === selectedMachine.uuid);
    if (user) {
      setSelectedUser(user);
    }
  };

  return (
    <Measure
      bounds
      onResize={(contentRect) => {
        if (contentRect.bounds) {
          setDimensions({
            width: contentRect.bounds.width,
            height: contentRect.bounds.height,
          });
        }
      }}
    >
      {({ measureRef }) => (
        <div ref={measureRef} style={{ width: '100%', height: '100%' }}>
          {dimensions.width > 0 && dimensions.height > 0 && (
            <Map
              width={dimensions.width}
              height={dimensions.height}
              defaultCenter={defaultCenter}
              defaultZoom={11}
            >
              {Object.entries(groupedPositions).map(([coords, machines]) => {
                const [longitude, latitude] = coords.split(',').map(Number);
                return (
                  <Marker
                    key={coords}
                    width={50}
                    anchor={[longitude, latitude]}
                    onClick={() => handleMarkerClick(machines, [longitude, latitude])}
                  />
                );
              })}
              {popupInfo.position && popupInfo.machines.length > 0 && (
                <Overlay anchor={popupInfo.position} offset={[0, -20]}>
                  <div className="bg-white p-4 rounded-lg shadow-lg max-w-md">
                    <h3 className="font-bold mb-2">Select a machine:</h3>
                    <div className="max-h-60 overflow-y-auto">
                      {popupInfo.machines.map((machine, index) => (
                        <div
                          key={machine.uuid}
                          className={`p-2 cursor-pointer hover:bg-gray-100 rounded ${
                            popupInfo.selectedMachine === index ? 'bg-blue-100' : ''
                          }`}
                          onClick={() => handleMachineSelect(index)}
                        >
                          <div className="font-semibold">{machine.machine_name}</div>
                          {popupInfo.selectedMachine === index && (
                            <div className="mt-2 text-sm">
                              <div><strong>Username:</strong> {machine.username}</div>
                              <div><strong>Domain:</strong> {machine.domain_name}</div>
                              <div><strong>IP:</strong> {machine.ip}</div>
                              <div><strong>Port:</strong> {machine.port}</div>
                              <div><strong>Admin:</strong> {machine.is_admin ? 'Yes' : 'No'}</div>
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                </Overlay>
              )}
            </Map>
          )}
        </div>
      )}
    </Measure>
  );
};

export default VictimMap;