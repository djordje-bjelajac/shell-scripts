# Shell Scripts

This repository contains a collection of useful shell scripts.

## Scripts

### update_repos.sh

This script loops through a list of directories, checks out the default branch, and runs `git pull`.

#### Usage

1. Make the script executable:

   ```bash
   chmod +x scripts/update_repos.sh
   ```

2. Install

   ```bash
   sudo make all
   ```

3. Reload the profile

   ```bash
   source ~/.zshrc
   ```

4. Run
   ```bash
      update_repos {path}
   ```
