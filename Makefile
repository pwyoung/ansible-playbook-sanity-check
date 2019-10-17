
ROLES=$(shell cat ./requirements.yml  | egrep '^ *name: ' | awk '{print $$2}')

#ANSIBLE_EXTRA_VARS='-e var1=val1 -e var2=val2'
#ANSIBLE_PLAYBOOK_CMD=ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yaml $(ANSIBLE_EXTRA_VARS)
ANSIBLE_PLAYBOOK_CMD=ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yaml

.PHONY=test

test: deps
	@ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yaml

deps:
	@ansible-galaxy install -r requirements.yml -f

clean:
	$(info Cleaning roles: $(ROLES))
	@-ansible-galaxy remove $(ROLES) &>/dev/null



