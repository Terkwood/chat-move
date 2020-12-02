# Multiplayer Chat/Move PoC

![multiplayer chat with physics](https://gist.githubusercontent.com/Terkwood/b91e15774b00d3ba45d5b06b86a8e7a7/raw/92aba0045b1cdeb7cc1b6b86d5560825b5d9bb63/chat-move.gif)

These applications constitute a prototype for a multiplayer, 2D world with chat. 
We use a client/server approach, such that the server could be hosted on a cloud
provider and run in headless mode.

Each player has the ability to move around, in addition to being able to chat.

## Source Projects

We shamelessly stole the bulk of this project from [this client-server example](https://gitlab.com/menip/godot-multiplayer-tutorials/-/blob/master/LobbylessTutorial/LobbylessTut.md).  Thank you to [menip](http://twitter.com/MenipTweet) for providing this code!

We drew further inspiration from [this chat example](http://www.narwalengineering.com/2018/07/01/godot-tutorial-simple-chat-room-using-multiplayer-api/).  Thank you!

## Additional Reading

In addition to the [official multiplayer docs](https://docs.godotengine.org/en/stable/tutorials/networking/high_level_multiplayer.html), we found [this cheatsheet](https://blog.iancolwell.ca/godot-multiplayer-networking-cheatsheet) helpful.
