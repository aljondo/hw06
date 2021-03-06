defmodule TrackerWeb.TimeBlockView do
  use TrackerWeb, :view
  alias TrackerWeb.TimeBlockView

  def render("index.json", %{timeblocks: timeblocks}) do
    %{data: render_many(timeblocks, TimeBlockView, "time_block.json")}
  end

  def render("show.json", %{time_block: time_block}) do
    %{data: render_one(time_block, TimeBlockView, "time_block.json")}
  end

  def render("time_block.json", %{time_block: time_block}) do
    %{id: time_block.id,
      start_time: time_block.start_time,
      end_time: time_block.end_time,
      task_id: time_block.task_id}
  end
end
