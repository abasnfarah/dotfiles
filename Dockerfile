from archlinux:base-devel as build
WORKDIR /workspace

ADD https://github.com/abasnfarah/dotfiles ./dotfiles/

COPY arch/ ./arch

COPY polling.sh ./polling.sh
RUN chmod +x /workspace/polling.sh
RUN PATH=$PATH:/workspace


ENTRYPOINT ["./polling.sh"]
