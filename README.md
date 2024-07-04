# Shell Scripts

This repository contains a collection of useful shell scripts.

## Scripts

### update_repos.sh

This script loops through a list of directories, checks out the default branch, and runs `git pull`.

#### Usage

1. Modify the `directories` array in the script to include your repository paths.
2. Make the script executable:

   ```bash
   chmod +x scripts/update_repos.sh
   ```
