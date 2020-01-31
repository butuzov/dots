cask_args appdir: "/Applications"

tap "homebrew/cask"
tap "homebrew/cask-fonts"

################################################################################
#  Brew's Formulas
################################################################################
[
    # BASH & GNU Compatible tooling
    "bash",
    "pstree",
    "psgrep",
    "pkill",
    "shellcheck",
    "htop",
    "coreutils",
    "gnu-sed",
    "gnu-tar",
    "grep",
    "gnu-indent",
    "findutils",
    "gawk",
    "tree",
    "jq",
    "bash-completion",
    "git",
    "git-lfs",
    "bat",
    "fd",
    "jmeter",
    "mtr",
    "di", # research

    # CLi other
    "ffmpeg",
    "media-info",

    # LOL
    "lolcat",
    "cowsay",
    "fortune",

    # DevOps - Kubernetes
    "kubernetes-cli",
    "krew",
    "helm",
    "grpcurl",
    "minikube",
    "kustomize",
    "istioctl",
    "skaffold",

    # DevOps - rest
    "ansible-lint",
    "serverless",
    "dive",
    "mitmproxy",
    "upx",

    # Development
    "pre-commit",
    "ctags",
    "graphviz",

    # Clouds
    "awscli",
    "cfn-lint",
    "aws-shell",
    "azure-cli",
    "yamllint",

    # Terraform
    "terraform",
    "tflint",
    "terragrunt",

    # Other hasicorp tooling
    "consul",
    "vault",
    "packer",


].each do |pkg|
    brew pkg
end

################################################################################
#  CASK's
################################################################################
[
    # TODO - RESEARCH
    "sampler",              # https://github.com/sqshq/sampler

    # DevOps - Tooling
    "podman",
    "google-cloud-sdk",
    "docker",
    "vagrant",
    "virtualbox",
    "vmware-fusion",

    # Programming - Tooling
    "postman",
    "visual-studio-code",
    "cronnix",
    "sourcetree",

    # Fonts
    "font-fira-code",
    "font-fira-sans",
    "font-fira-mono",

    # Messangers
    "slack",
    "skype",
    "telegram-desktop",

    # Mac App Tools
    "dropbox",
    "appcleaner",
    "ankiapp-anki",
    "istat-menus",
    "little-snitch",
    "keka",
    "iina",
    "handbrake",
    "imageoptim",
    "fantastical",
    "google-chrome",

    # Dev
    "iterm2",

].each do |pkg|
    cask pkg
end


# Mac Applications - AppStore
mas "Apple Remote Desktop",        id: 409907375      # ARD
mas "Audiobook Builder",           id: 406226796      # Older Version
mas "Helium",                      id: 1054607607     # Helium
mas "Divvy - Window Manager",      id: 413857545      # Divvy
mas "Horo - Timer for Menu Bar",   id: 1437226581     # Horo Timer

# temporary disabled unused applications
# mas "Encrypto: Secure Your Files", id: 413857545      # 935235287
# mas "Evolve Tracking Freelancer",  id: 1286846351
