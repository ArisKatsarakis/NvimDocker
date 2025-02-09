FROM alpine 

RUN apk update  && apk add gcc neovim  git g++ zlib zlib-dev 

RUN mkdir -p /root/.config/

COPY nvim/ /root/.config/nvim

ENTRYPOINT [ "/bin/sh" ]
