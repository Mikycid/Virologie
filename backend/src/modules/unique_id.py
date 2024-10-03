import os
print(os.popen("wmic csproduct get uuid").read().strip().splitlines()[-1])