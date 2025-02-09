FROM alpine 

RUN apk update  && apk add gcc neovim  git g++ zlib zlib-dev  nodejs npm  lua-language-server neovim-doc make ripgrep fd fzf  curl openjdk21-jdk jdtls maven gradle cargo 

RUN mkdir -p /root/.config/

COPY nvim/ /root/.config/nvim

ENTRYPOINT [ "/bin/sh" ]
