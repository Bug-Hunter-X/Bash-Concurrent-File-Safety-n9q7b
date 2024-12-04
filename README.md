# Race Condition in Bash Script

This repository demonstrates a common race condition bug in shell scripting.  Multiple processes concurrently attempt to update a shared file, leading to inconsistent results. The script `bug.sh` exhibits this issue, while `bugSolution.sh` provides a corrected version using appropriate locking mechanisms.

## Bug Description

The `bug.sh` script uses a simple counter implemented using a file. It increments the counter in parallel multiple times. Because there is no locking mechanism, processes contend to read and write to the file, leading to lost updates. This results in a final counter value less than expected.

## Solution

The `bugSolution.sh` script solves this by using file locking to ensure that only one process can access and update the counter at any given time. This prevents race conditions and guarantees accurate incrementing.