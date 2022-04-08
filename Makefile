VENV_NAME?=venv
PYTHON=${VENV_NAME}/bin/python3

.DEFAULT_GOAL: help
help:
	@echo "make test"
	@echo "		  run tests"


$(VENV_NAME): $(VENV_NAME)/bin/activate

$(VENV_NAME)/bin/activate: requirements.txt requirements-test.txt
	test -d $(VENV_NAME) || python3 -m venv $(VENV_NAME)
	$(PYTHON) -m pip install pip -U
	$(PYTHON) -m pip install -r requirements-test.txt


.PHONY: test
test:
	$(PYTHON) manage.py test

.PHONY: clean
clean:
	find . -name "*.pyc" -delete
	find . -type d -iname "__pycache__" -delete
	rm -rf $(VENV_NAME)/
