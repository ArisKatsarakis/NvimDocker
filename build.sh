docker build . -f nvim_lazyvim.Dockerfile -t docker/nvim-lazyvim
docker run --rm -it --mount type=bind,source="$(pwd)/nvim-config",target=/root/.config/nvim -t docker/nvim-lazyvim
