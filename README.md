# MultiplePhxInstances

Run multiple phoenix instances that direct messages to a websocket through pubsub.

Start 2 terminal windows and run

```
# first terminal
PORT=4001 iex --name n1@127.0.0.1 --erl "-config sys.config" -S mix phx.server

# second terminal
PORT=4002 iex --name n2@127.0.0.1 --erl "-config sys.config" -S mix phx.server
```

Then open http://localhost:4001/ and open the JS console. You will see two sets of messages from both phoenix apps.
