defmodule TwoWayWeb.Schema.Middleware.ChangesetErrors do
  @behaviour Absinthe.Middleware

  def call(res, _) do
    l = Map.get(res, :errors)
    if length(l) == 2 do
      [h | t] = l
      %{res |
        value: %{errors: [%{key: h, message: t}]},
        errors: [],
      }
    else
      with %{errors: [%Ecto.Changeset{} = changeset]} <- res do
        IO.inspect( %{errors: transform_errors(changeset)})
        %{res |
          value: %{errors: transform_errors(changeset)},
          errors: [],
        }
      end
    end
  end

  @doc """
  def call(res, _) do
    case res do
      %{errors: [%Ecto.Changeset{} = changeset]} = res ->
        %{res |
          value: %{errors: transform_errors(changeset)},
          errors: [],
         }
      %{errors: [:error, msg]} = res ->
        %{res |
          value: %{errors: [%{key: "No Key", message: msg}]},
          errors: [],
         }
      true ->
        res
    end
  end
  """

  defp transform_errors(changeset) do
    changeset
    |> Ecto.Changeset.traverse_errors(&format_error/1)
    |> Enum.map(fn
      {key, value} ->
        %{key: key, message: value}
    end)
  end

  defp format_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end

end
