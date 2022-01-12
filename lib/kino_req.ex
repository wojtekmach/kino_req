defimpl Kino.Render, for: Req.Response do
  def to_livebook(response) do
    case List.keyfind(response.headers, "content-type", 0) do
      {_, "image/" <> _ = content_type} ->
        Kino.Image.new(response.body, content_type)
        |> Kino.Render.Kino.Image.to_livebook()

      {_, "text/csv"} when is_list(response.body) ->
        Kino.DataTable.new(response.body)
        |> Kino.Render.Kino.DataTable.to_livebook()

      _ ->
        response
    end
  end
end
