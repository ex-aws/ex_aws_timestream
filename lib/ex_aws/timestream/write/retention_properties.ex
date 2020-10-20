defmodule ExAws.Timestream.Write.RetentionProperties do
  @type t :: %__MODULE__{
          magnetic_store: pos_integer,
          memory_store: pos_integer
        }

  @enforce_keys [:magnetic_store, :memory_store]
  defstruct magnetic_store: nil, memory_store: nil

  @doc "Create a new RetentionProperties struct"
  @spec new(magnetic_store :: pos_integer, memory_store :: pos_integer) :: t()
  def new(magnetic_store, memory_store),
    do: %__MODULE__{magnetic_store: magnetic_store, memory_store: memory_store}
end
