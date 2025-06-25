# Define the virtual environment directory
VENV_DIR = venv/bin/activate

# Function to activate the virtual environment
ACTIVATE = . $(VENV_DIR)

pipinstall:
	$(ACTIVATE); pip install -r requirements.txt

# make bash cmd="your-shell-command-here"
bash:
	$(ACTIVATE); $(cmd)	

serve:
	$(ACTIVATE); mkdocs serve


serve-mike:
	$(ACTIVATE); mike serve

# make set_default_version VERSION="your-version-here-1.0"
set_default_version:
	mike set-default $(VERSION)

# make build_version VERSION="your-version-here-1.0"
build_version:
	$(ACTIVATE); mike deploy --push $(VERSION) latest --update-aliases


# make delete_version VERSION="your-version-here-1.0"
delete_version:
	$(ACTIVATE); mike delete $(VERSION)

list_versions:
	$(ACTIVATE); mike list

deploy:
	$(ACTIVATE); ghp-import -n -p -f site/