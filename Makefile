NAME=git-surf
INSTALL_PATH=/usr/local/bin/$(NAME)

VIM_AUTOLOAD=~/.vim/autoload/
VIM_FILE=./extras/gitbrowse.vim
VIM_INFO=./extras/vim.md

VERSION = $(shell cat VERSION)
RELEASED = $(shell date)

test:
	@bash ./t/git-surf-test.sh

release:
	@echo Creating release for ${VERSION}
	@sed -i "s/_VERSION=.*/_VERSION=${VERSION}/g"  ${NAME}
	@sed -i "s/_RELEASED=.*/_RELEASED=\"${RELEASED}\"/g" ${NAME}
	@git tag v${VERSION}

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
