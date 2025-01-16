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
    user: null | {
      uuid: string;
      domain_name: string;
      ip: string;
      port: number;
      is_admin: boolean;
      username: string;
      machine_name: string;
    };
    position: [number, number] | null;
  }>({ user: null, position: null });

  const validPositions = users.filter((user) => {
    return (
      user.latitude !== null &&
      user.longitude !== null &&
      !isNaN(user.latitude!) &&
      !isNaN(user.longitude!)
    );
  });

  const handleMarkerClick = (user: any) => {
    setPopupInfo({
      user: {
        uuid: user.uuid,
        domain_name: user.domain_name,
        ip: user.ip,
        port: user.port,
        is_admin: user.is_admin,
        username: user.username,
        machine_name: user.machine_name,
      },
      position: [user.longitude, user.latitude],
    });
    setSelectedUser(user.uuid);
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
              {validPositions.map((user) => (
                <Marker
                  key={user.uuid}
                  width={50}
                  anchor={[Number(user.longitude), Number(user.latitude)]}
                  onClick={() => handleMarkerClick(user)}
                />
              ))}

              {popupInfo.user && popupInfo.position && (
                <Overlay anchor={popupInfo.position} offset={[0, -20]}>
                  <div style={{
                    backgroundColor: 'white',
                    padding: '10px',
                    borderRadius: '5px',
                    boxShadow: '0 2px 10px rgba(0, 0, 0, 0.2)',
                  }}>
                    <strong>Username:</strong> {popupInfo.user.username}<br />
                    <strong>Machine:</strong> {popupInfo.user.machine_name}<br />
                    <strong>Domain:</strong> {popupInfo.user.domain_name}<br />
                    <strong>IP:</strong> {popupInfo.user.ip}<br />
                    <strong>Port:</strong> {popupInfo.user.port}<br />
                    <strong>Admin:</strong> {popupInfo.user.is_admin ? 'Yes' : 'No'}<br />
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
