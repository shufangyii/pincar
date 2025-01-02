FROM ubuntu:latest AS base

RUN dependUtils="git wget curl zsh" \
    && apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y $dependUtils \
    # install ohmyzsh
    && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    # install zsh plugins
    && git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
    # clear
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*

COPY .zshrc /root

####################
### fe dev image ###
####################
FROM base AS fe-dev

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    # enable nvm
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && echo "source $NVM_DIR/nvm.sh" >> $HOME/.zshrc \  
    # install node lts
    && nvm install node --lts \
    # enable corepack
    && corepack enable

ENTRYPOINT ["zsh"]
