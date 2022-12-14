defmodule GradientTestProject do
  use Gradient.TypeAnnotation

  def hello do
    :world
  end

  @spec my_info() :: Keyword.t()
  def my_info do
    # the returned value cannot be nil,
    # as "process can make calls" implies "process is alive",
    # so we assert that it is indeed a keyword list
    Process.info(self())
    |> assert_type(Keyword.t())
  end
end
