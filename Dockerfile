FROM archlinux:base-devel as build
WORKDIR /workspace

RUN yes Y | pacman -Syu git

RUN yes Y | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/abasnfarah/dotfiles/archbox/Install)" 

COPY polling.sh ./polling.sh
RUN chmod +x /workspace/polling.sh
RUN PATH=$PATH:/workspace

ENTRYPOINT ["./polling.sh"]
