FROM alpine 

RUN apk update  && apk add gcc neovim  git g++ zlib zlib-dev  node npm  lua-language-server neovim-doc

RUN mkdir -p /root/.config/

COPY nvim/ /root/.config/nvim

ENTRYPOINT [ "/bin/sh" ]
