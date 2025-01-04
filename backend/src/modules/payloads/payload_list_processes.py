

def get_processes_with_owner():
    import subprocess
    cmd_tasklist = 'tasklist /V /FO CSV'
    cmd_wmic = 'wmic process get ProcessId,Name,HandleCount /FORMAT:CSV'
    
    processes = {}
    
    try:
        output = subprocess.check_output(cmd_tasklist, shell=True)
        for line in output.decode('utf-8', errors='ignore').strip().split('\n')[1:]:
            if line:
                parts = line.replace('"', '').split(',')
                if len(parts) >= 8:
                    pid = parts[1]
                    processes[pid] = {
                        'name': parts[0],
                        'pid': pid,
                        'owner': parts[6]
                    }
                    
        output = subprocess.check_output(cmd_wmic, shell=True)
        for line in output.decode('utf-8', errors='ignore').strip().split('\n')[1:]:
            if ',' in line:
                parts = line.strip().split(',')
                if len(parts) >= 3:
                    pid = parts[-2]
                    if pid in processes:
                        processes[pid]['handles'] = parts[-1]
                        
        return list(processes.values())

    except Exception as e:
        print(f"Error: {e}")
        return []

processes = get_processes_with_owner()
print(processes)