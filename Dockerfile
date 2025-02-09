FROM alpine 

RUN apk update  && apk add gcc neovim  git g++ zlib zlib-dev  node npm  lua-language-server neovim-doc make ripgrep fd fzf  curl

RUN mkdir -p /root/.config/

COPY nvim/ /root/.config/nvim

ENTRYPOINT [ "/bin/sh" ]
