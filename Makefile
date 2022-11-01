PROGRAM_NAME=archtorify
DATA_DIR=/usr/share
BACKUP_DIR=/var/lib
LICENSE_DIR=$(DATA_DIR)/licenses
DOC_DIR=$(DATA_DIR)/doc
PROGRAM_DIR=/usr/bin


archinstall:
	$(MAKE) archuninstall
	yes | pacman -S git
	git clone https://github.com/brainfucksec/archtorify
	install -Dm644 ./archtorify/LICENSE $(LICENSE_DIR)/$(PROGRAM_NAME)/LICENSE
	install -Dm644 ./archtorify/README.md $(DOC_DIR)/$(PROGRAM_NAME)/README.md
	install -Dm755 ./archtorify/archtorify.sh $(PROGRAM_DIR)/$(PROGRAM_NAME)
	mkdir -p $(DATA_DIR)/$(PROGRAM_NAME)/data
	mkdir -p $(BACKUP_DIR)/$(PROGRAM_NAME)/backups
	install -Dm644 ./archtorify/data/* $(DATA_DIR)/$(PROGRAM_NAME)/data
	mkdir /usr/share/TorifyChooser
	cp main.py /usr/share/TorifyChooser/TorifyChooser.py
	echo 'python /usr/share/TorifyChooser/TorifyChooser.py' > /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod +x /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod 777 /usr/share/archtorify/data/torrc

archuninstall:
	rm -Rf *torify
	rm -Rf $(PROGRAM_DIR)/$(PROGRAM_NAME)
	rm -Rf $(DATA_DIR)/$(PROGRAM_NAME)
	rm -Rf $(LICENSE_DIR)/$(PROGRAM_NAME)
	rm -Rf $(DOC_DIR)/$(PROGRAM_NAME)
	rm -Rf $(BACKUP_DIR)/$(PROGRAM_NAME)
	rm -Rf /usr/share/TorifyChooser
	rm -Rf /usr/local/bin/TorifyChooser	


kaliinstall:
	$(MAKE) kaliuninstall
	apt-get install git
	git clone https://github.com/bainfucksec/kalitorify
	install -Dm644 ./kalitorify/README.md $(DOC_DIR)/$(PROGRAM_NAME)/README.md
	install -Dm755 ./kalitorify/kalitorify.sh $(PROGRAM_DIR)/$(PROGRAM_NAME)
	mkdir -p $(DATA_DIR)/$(PROGRAM_NAME)/data
	mkdir -p $(BACKUP_DIR)/$(PROGRAM_NAME)/backups
	install -Dm644 ./kalitorify/data/* $(DATA_DIR)/$(PROGRAM_NAME)/data
	mkdir /usr/share/TorifyChooser
	cp main.py /usr/share/TorifyChooser/TorifyChooser.py
	echo 'python /usr/share/TorifyChooser/TorifyChooser.py' > /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod +x /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod 777 /usr/share/archtorify/data/torrc
		

kaliuninstall:
	rm -Rf $(PROGRAM_DIR)/$(PROGRAM_NAME)
	rm -Rf $(DATA_DIR)/$(PROGRAM_NAME)
	rm -Rf $(DOC_DIR)/$(PROGRAM_NAME)
	rm -Rf $(BACKUP_DIR)/$(PROGRAM_NAME)
	rm -Rf /usr/share/TorifyChooser
	rm -Rf /usr/local/bin/TorifyChooser

