FROM --platform=linux/amd64 archlinux:latest

RUN pacman -Syu --noconfirm 
RUN pacman -S git neovim gcc gdb ripgrep lazygit fd unzip --noconfirm
RUN pacman -S ttf-jetbrains-mono-nerd --noconfirm
RUN mkdir ~/.config
RUN mkdir ~/.config/nvim
COPY ./nvim-config ~/.config/nvim/

ENTRYPOINT ["bash"]
