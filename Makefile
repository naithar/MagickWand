export BUILDER_SCRIPTS_DIR=Package-Builder/build

-include Package-Builder/build/Makefile

Package-Builder/build/Makefile:
	@echo --- Fetching Package-Builder submodule
	git submodule update --init --remote --merge --recursive
