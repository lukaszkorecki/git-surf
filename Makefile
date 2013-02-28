NAME=git-browse
INSTALL_PATH=/usr/local/bin/$(NAME)
install:
	cp $(NAME) $(INSTALL_PATH)
	chmod +x $(INSTALL_PATH)
uninstall:
	rm $(INSTALL_PATH)
