FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    fish  \
    curl \
    gnupg \
    ca-certificates \
    fzf \
    && rm -rf /var/lib/apt/lists/*

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
COPY chezmoi.toml /root/.config/chezmoi/chezmoi.toml

RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

ENTRYPOINT ["chezmoi", "init", "https://github.com/schurmann/dotfiles.git"]

