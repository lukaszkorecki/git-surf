NAME=git-surf
INSTALL_PATH=/usr/local/bin/$(NAME)

VIM_AUTOLOAD=~/.vim/autoload/
VIM_FILE=./extras/gitbrowse.vim
VIM_INFO=./extras/vim.md

test:
	@bash ./t/git-surf-test.sh

install:
	@echo "Moving $(NAME) to $(INSTALL_PATH)"
	@cp $(NAME) $(INSTALL_PATH)
	@chmod +x $(INSTALL_PATH)
uninstall:
	@echo "Removing $(NAME) from $(INSTALL_PATH)"
	@rm $(INSTALL_PATH)
vim:
	@echo "Installing vim mappings to $(VIM_AUTOLOAD)"
	@cp $(VIM_FILE) $(VIM_AUTOLOAD)
	@cat $(VIM_INFO)
