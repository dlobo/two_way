defmodule TwoWay.Communication.Contact do
  defmacro __using__(_opts \\ []) do
    quote do
    end
  end

  def status(args) do
    bsp_module()
    |> apply(:status, [args])
  end

  def bsp_module() do
    bsp = TwoWay.Commnunications.effective_bsp()
    String.to_existing_atom(to_string(bsp) <> ".Contact")
  end
end
