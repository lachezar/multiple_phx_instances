defmodule MultiplePhxInstances.Tick do
  @moduledoc """
  A GenServer template for a "singleton" process.
  """
  use GenServer

  # Initialization
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, [name: __MODULE__])
  end

  def init(_opts) do
    Process.send_after(self(), :tick, 1_000)
    state = 0
    {:ok, state}
  end

  def handle_info(:tick, state) do
    Process.send_after(self(), :tick, 1_000)
    state = state + 1
    IO.puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #{state}"
    MultiplePhxInstancesWeb.Endpoint.broadcast!("room:lobby", "ping", %{tick: state})
    {:noreply, state}
  end
end
