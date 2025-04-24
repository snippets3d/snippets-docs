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

build:
	$(ACTIVATE); mkdocs build