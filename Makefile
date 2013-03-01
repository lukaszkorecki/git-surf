NAME=git-browse
INSTALL_PATH=/usr/local/bin/$(NAME)
install:
	@echo "Moving $(NAME) to $(INSTALL_PATH)"
	@cp $(NAME) $(INSTALL_PATH)
	@chmod +x $(INSTALL_PATH)
uninstall:
	@echo "Removing $(NAME) from $(INSTALL_PATH)"
	@rm $(INSTALL_PATH)
