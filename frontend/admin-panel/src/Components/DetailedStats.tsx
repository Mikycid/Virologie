import React, { useMemo } from 'react';
import { useUserStore } from '@/Stores/UserStore';
import {
  BarChart,
  Bar,
  PieChart,
  Pie,
  Cell,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from 'recharts';
import { Card } from '@/Components/ui/Card';

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884d8'];

const DetailedStats = () => {
  const { users } = useUserStore();

  const stats = useMemo(() => {
    // User roles distribution
    const roleStats = [
      { name: 'Domain Admin', value: users.filter((u) => u.is_domain_admin).length },
      { name: 'Admin', value: users.filter((u) => u.is_admin && !u.is_domain_admin).length },
      { name: 'Regular User', value: users.filter((u) => !u.is_admin && !u.is_domain_admin).length },
    ];

    // Country distribution
    const countryData = users.reduce((acc, user) => {
      const country = user.country || 'Unknown';
      acc[country] = (acc[country] || 0) + 1;
      return acc;
    }, {} as Record<string, number>);

    const countryStats = Object.entries(countryData)
      .map(([name, value]) => ({ name, value }))
      .sort((a, b) => b.value - a.value)
      .slice(0, 5);

    // Connection time distribution (30-minute intervals)
    const timeStats = users
      .flatMap((user) =>
        user.connection_time
          .filter((event) => event.event === 'login') // Only count login events
          .map((event) => {
            const normalizedTimestamp = event.timestamp.replace("CET", "+01:00");
            const date = new Date(normalizedTimestamp); // Parse normalized timestamp
            const minutesSinceMidnight = date.getUTCHours() * 60 + date.getUTCMinutes();
            const interval = Math.floor(minutesSinceMidnight / 30); // Calculate 30-minute interval
            return interval;
          })
      )
      .reduce((acc, interval) => {
        acc[interval] = (acc[interval] || 0) + 1;
        return acc;
      }, {} as Record<number, number>);

    const connectionTimeData = Array.from({ length: 48 }, (_, i) => ({
      time: `${String(Math.floor(i / 2)).padStart(2, '0')}:${i % 2 === 0 ? '00' : '30'}`,
      connections: timeStats[i] || 0,
    }));

    return {
      roleStats,
      countryStats,
      connectionTimeData,
    };
  }, [users]);

  return (
    <div className="p-6 space-y-6 bg-gray-50">
      <h1 className="text-2xl font-bold mb-6">Infection Analytics Dashboard</h1>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {/* User Roles Distribution */}
        <Card title="Infected Roles Distribution">
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <PieChart>
                <Pie
                  data={stats.roleStats}
                  dataKey="value"
                  nameKey="name"
                  cx="50%"
                  cy="50%"
                  outerRadius={80}
                  label
                >
                  {stats.roleStats.map((_, index) => (
                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </Card>

        {/* Top Countries */}
        <Card title="Top Countries">
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <BarChart data={stats.countryStats}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="name" />
                <YAxis />
                <Tooltip />
                <Bar dataKey="value" fill="#8884d8" />
              </BarChart>
            </ResponsiveContainer>
          </div>
        </Card>

        {/* Connection Time Distribution */}
        <Card title="Connection Time Distribution (30-min Intervals)" className="md:col-span-2">
          <div className="h-64">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={stats.connectionTimeData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis
                  dataKey="time"
                  interval={3} // Show one label every 3 intervals to avoid overlap
                  tickFormatter={(time) => time}
                />
                <YAxis />
                <Tooltip />
                <Line type="monotone" dataKey="connections" stroke="#8884d8" strokeWidth={2} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </Card>
      </div>

      {/* Summary Statistics */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card title="Total Infected">
          <p className="text-3xl font-bold">{users.length}</p>
        </Card>

        <Card title="Active Infected(s)">
          <p className="text-3xl font-bold">{users.filter((user) => user.logged).length}</p>
        </Card>

        <Card title="Total Countrie(s)">
          <p className="text-3xl font-bold">
            {new Set(users.map((user) => user.country).filter(Boolean)).size}
          </p>
        </Card>
      </div>
    </div>
  );
};

export default DetailedStats;
