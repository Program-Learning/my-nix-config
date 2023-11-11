.
├── flake.lock
├── flake.nix
├── home                     # home modules dir
│   ├── common               # common modules for all system all arch
│   │   └── modules
│   ├── darwin
│   │   ├── aarch64
│   │   │   └── common       # common modules for darwin aarch64
│   │   │       └── modules
│   │   ├── common           # common modules for darwin all arch
│   │   │   └── modules
│   │   └── x86
│   │       └── common       # common modules for darwin x86
│   │           └── modules
│   ├── nix-on-droid
│   │   ├── aarch64
│   │   │   ├── common
│   │   │   │   └── modules
│   │   │   └── mondrian_1
│   │   │       ├── home.nix
│   │   │       └── modules
│   │   │           ├── creative.nix
│   │   │           ├── default.nix
│   │   │           ├── development.nix
│   │   │           └── font.nix
│   │   ├── common
│   │   │   └── modules
│   │   └── x86
│   │       └── common
│   │           └── modules
│   └── nixos
│       ├── aarch64
│       │   └── common
│       │       └── modules
│       ├── common
│       │   └── modules
│       └── x86
│           └── common
│               └── modules
├── hosts                    # nixos/nix modules dir
│   ├── common
│   │   └── modules
│   ├── darwin
│   │   ├── aarch64
│   │   │   └── common
│   │   │       └── modules
│   │   ├── common
│   │   │   └── modules
│   │   └── x86
│   │       └── common
│   │           └── modules
│   ├── nix-on-droid
│   │   ├── aarch64
│   │   │   ├── common
│   │   │   │   └── modules
│   │   │   └── mondrian_1
│   │   │       ├── modules
│   │   │       │   └── default.nix
│   │   │       └── nix-on-droid.nix
│   │   ├── common
│   │   │   └── modules
│   │   │       ├── authorized_keys
│   │   │       ├── extra_keys.nix
│   │   │       ├── proxychains.nix
│   │   │       ├── sshd.nix
│   │   │       └── termux.properties
│   │   └── x86
│   │       └── common
│   │           └── modules
│   └── nixos
│       ├── aarch64
│       │   └── common
│       │       └── modules
│       ├── common
│       │   └── modules
│       └── x86
│           └── common
│               └── modules
├── lib        # I use this to simplify the way to make system/environment
│   └── nix-on-droid.nix 
├── Makefile   # I use this to simplify my command
├── README.md
├── Reference.md
└── struct.md  # the structure

