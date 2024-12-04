#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file to track the counter
touch counter.txt

# Function to increment the counter
increment_counter() {
  local current_count=$(cat counter.txt)
  local new_count=$((current_count + 1))
  echo $new_count > counter.txt
}

# Run the increment_counter function multiple times in parallel
for i in $(seq 1 100);
do
  increment_counter &
done

# Wait for all background processes to finish
wait

# Print the final counter value
echo "Final count: $(cat counter.txt)"

#Expected output: 100
#Actual output: Less than 100, due to race condition.