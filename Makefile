#
#  NOTE: Makefile's target name should not be the same as one of the file or directory in the current directory, 
#    otherwise the target will not be executed!
#


############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

mondrian_1:
	NIXPKGS_ALLOW_UNFREE=1 nix-on-droid switch --flake ~/my-nix-config#mondrian_1

nix-on-droid_x11:
	nix-shell ~/my-nix-config/scripts/x11.nix --run "myx :1"

update:
	nix flake update

# Update specific input
# usage: make update_input i=wallpapers
update_input:
	nix flake lock --update-input $(i)

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug

############################################################################
#
#  My often-used command
#
############################################################################

nur_all := nur-program-learning nur-linyinfeng nur-xddxdd nur-AtaraxiaSjel nur-arti5an

# Update nur inputs 
# (can use with ''
# proxychains4 make update_nur
# '' 
# or ''
# http_proxy='http://localhost:7890' https_proxy='http://localhost:7890' make update_nur 
# '')
update_nur:
	$(foreach repo,$(nur_all)\
		,nix flake lock --update-input $(repo) &&) true

# nix-repl:
# 	NIX_PATH=nixpkgs=http://nixos.org/channels/nixos-23.05/nixexprs.tar.xz:home-manager=https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz:nix-on-droid=https://github.com/t184256/nix-on-droid/archive/release-23.05.tar.gz nix repl
# # for nix-on-droid:
# # nix-repl> hm = import <home-manager/modules> { configuration = ~/my-nix-config/home/nix-on-droid/aarch64/mondrian_1/home.nix; pkgs = import <nixpkgs> {}; }
