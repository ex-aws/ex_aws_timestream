defmodule ExAws.Timestream.Write.Dimension do
  @moduledoc """
  Dimension represents the meta data attributes of the time series.
  https://docs.aws.amazon.com/timestream/latest/developerguide/API_Dimension.html
  """

  @type t :: %__MODULE__{
          name: binary,
          value: binary,
          dimension_value_type: binary
        }

  @enforce_keys [:name, :value]
  defstruct name: nil, value: nil, dimension_value_type: nil

  @doc "Create a new Dimension struct"
  @spec new(name :: binary, value :: binary) :: t()
  def new(name, value), do: %__MODULE__{name: name, value: value}

  @doc "Create a new Dimension struct with a specific DimensionValueType"
  @spec new(name :: binary, value :: binary, dimension_value_type :: binary) :: t()
  def new(name, value, dimension_value_type),
    do: %__MODULE__{name: name, value: value, dimension_value_type: dimension_value_type}
end
