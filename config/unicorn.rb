# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/ninequeens/snb_portal"

# Unicorn PID file locationt
# pid "/path/to/pids/unicorn.pid"
#pid "/home/rishabh/desktop/snb/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/ninequeens/snb_portal/log/unicorn.log"
stdout_path "/home/ninequeens/snb_portal/log/unicorn.log"

# Unicorn socket
#listen "/tmp/unicorn.snb.sock"
listen 3001
# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30