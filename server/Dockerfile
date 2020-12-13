FROM leiterjakab/godot-server-alpine

COPY --chown=godot:godot target/chat-move-server.pck /godot/chat-move-server.pck

WORKDIR /godot
USER godot
EXPOSE 34543

CMD ["./godot", "--main-pack", "chat-move-server.pck"]