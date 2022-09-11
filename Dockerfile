FROM archlinux:base-devel as build
WORKDIR /workspace

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/abasnfarah/dotfiles/main/Install)" 

COPY polling.sh ./polling.sh
RUN chmod +x /workspace/polling.sh
RUN PATH=$PATH:/workspace

ENTRYPOINT ["./polling.sh"]
