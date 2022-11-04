

archinstall:
	make archuninstall
	pip install -r requirements.txt
	pacman -S git
	git clone https://github.com/brainfucksec/archtorify
	install -Dm644 ./archtorify/LICENSE /usr/share/licenses/archtorify/LICENSE
	install -Dm644 ./archtorify/README.md /usr/share/doc/archtorify/README.md
	install -Dm755 ./archtorify/archtorify.sh /usr/bin/archtorify
	mkdir -p /usr/share/archtorify/data
	mkdir -p /var/lib/archtorify/backups
	install -Dm644 ./archtorify/data/* /usr/share/archtorify/data
	mkdir /usr/share/TorifyChooser
	cp main.py /usr/share/TorifyChooser/TorifyChooser.py
	echo 'python /usr/share/TorifyChooser/TorifyChooser.py' > /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod +x /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod 777 /usr/share/archtorify/data/torrc

archuninstall:
	rm -Rf *torify
	rm -Rf /usr/bin/archtorify
	rm -Rf /usr/share/archtorify
	rm -Rf /usr/share/licenses/archtorify
	rm -Rf /usr/share/doc/archtorify
	rm -Rf /var/lib/archtorify
	rm -Rf /usr/share/TorifyChooser
	rm -Rf /usr/local/bin/TorifyChooser	


kaliinstall:
	make kaliuninstall
	pip install -r requirements.txt
	apt-get install git
	git clone https://github.com/brainfucksec/kalitorify
	install -Dm644 ./kalitorify/README.md /usr/share/doc/kalitorify/README.md
	install -Dm755 ./kalitorify/kalitorify.sh /usr/bin/kalitorify
	mkdir -p /usr/share/kalitorify/data
	mkdir -p /var/lib/kalitorify/backups
	install -Dm644 ./kalitorify/data/* /usr/share/kalitorify/data
	mkdir /usr/share/TorifyChooser
	cp main.py /usr/share/TorifyChooser/TorifyChooser.py
	echo 'python /usr/share/TorifyChooser/TorifyChooser.py' > /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod +x /usr/local/bin/TorifyChooser
	chmod 777 /usr/local/bin/TorifyChooser
	chmod 777 /usr/share/archtorify/data/torrc		

kaliuninstall:
	rm -Rf *torify
	rm -Rf /usr/bin/kalitorify     
	rm -Rf /usr/share/kalitorify
	rm -Rf /usr/share/licenses/kalitorify
	rm -Rf /usr/share/doc/kalitorify
	rm -Rf /var/lib/kalitorify
	rm -Rf /usr/share/TorifyChooser
	rm -Rf /usr/local/bin/TorifyChooser
