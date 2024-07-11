# Define the directory where the scripts are located
SCRIPTS_DIR=./scripts

# List all the scripts you want to install
SCRIPTS=$(wildcard $(SCRIPTS_DIR)/*.sh)

# Define the installation directory
INSTALL_DIR=/usr/local/bin

# RC file
RC_FILE=.zshrc

# Default target
all: install add-path

# Install target
install:
	@echo "Installing scripts to $(INSTALL_DIR)"
	@for script in $(SCRIPTS); do \
		script_name=$$(basename $$script .sh); \
		echo "Installing $$script_name"; \
		install -m 755 $$script $(INSTALL_DIR)/$$script_name; \
	done

# Uninstall target
uninstall:
	@echo "Uninstalling scripts from $(INSTALL_DIR)"
	@for script in $(SCRIPTS); do \
		script_name=$$(basename $$script .sh); \
		echo "Uninstalling $$script_name"; \
		rm -f $(INSTALL_DIR)/$$script_name; \
	done

# Add PATH to .bashrc or .zshrc
add-path:
	@echo "Appending PATH to $(RC_FILE);"
		echo 'export PATH="$(INSTALL_DIR):$$PATH"' >> $$HOME/$(RC_FILE)

# Clean target (optional)
clean:
	@echo "Cleaning up"
	@rm -f $(INSTALL_DIR)/*

# Phony targets
.PHONY: all install uninstall clean