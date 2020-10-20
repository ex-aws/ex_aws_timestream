defmodule ExAws.Timestream.Write.Record do
  @moduledoc """
  Record represents a time series data point being written into Timestream.
  https://docs.aws.amazon.com/timestream/latest/developerguide/API_Record.html
  """
  @type dimension :: ExAws.Timestream.Write.Dimension.t()
  @type t :: %__MODULE__{
          dimensions: [dimension],
          measure_name: binary,
          measure_value: binary,
          measure_value_type: binary,
          time: binary,
          time_unit: binary
        }

  defstruct dimensions: [],
            measure_name: nil,
            measure_value: nil,
            measure_value_type: nil,
            time: nil,
            time_unit: nil

  @doc "Create a new Record struct"
  @type new_opts :: %{
          dimensions: [dimension],
          measure_name: binary,
          measure_value: binary,
          measure_value_type: binary,
          time: binary,
          time_unit: binary
        }
  @spec new(new_opts :: new_opts) :: t()
  def new(opts \\ []), do: struct!(__MODULE__, opts)

  @doc "Add a dimension to a record struct"
  @spec add_dimension(record :: t(), dimension :: dimension) :: t()
  def add_dimension(%__MODULE__{dimensions: dimensions} = record, dimension),
    do: %{record | dimensions: dimensions ++ [dimension]}
end
