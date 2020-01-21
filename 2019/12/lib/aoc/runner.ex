defmodule AOC.Runner do
  alias AOC.{CombinePermute,Point,Velocity}

  def part_1 do
    energy_after(structured_data(), 1000)
  end

  def part_2 do
    repeat_after(structured_data, structured_data, 0)
  end

  def repeat_after(state, original, runs, found \\ %{}) do
    next_state = state |> run_for(1)
    runs = runs + 1

    found = if checkx(next_state, original) do
      Map.put_new(found, :x, runs)
    else
      found
    end

    found = if checky(next_state, original) do
      Map.put_new(found, :y, runs)
    else
      found
    end

    found = if checkz(next_state, original) do
      Map.put_new(found, :z, runs)
    else
      found
    end

    if Map.keys(found) |> length == 3 do
      found
      |> lcm
    else
      repeat_after(next_state, original, runs, found)
    end
  end

  def energy_after(state, steps) do
    run_for(state, steps)
    |> Enum.map(fn({p, v}) ->
      (abs(p.x) + abs(p.y) + abs(p.z)) *
      (abs(v.vx) + abs(v.vy) + abs(v.vz))
    end)
    |> Enum.sum
  end

  def run_for(state, 0), do: state
  def run_for(state, n) do
    state
    |> apply_gravity
    |> apply_velocity
    |> run_for(n - 1)
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp apply_gravity(state) do
    state
    |> Enum.map(&{&1, Enum.reject(state, fn(a) -> a == &1 end)})
    |> Enum.map(fn({{position, velocity}, others}) ->
      {cvx, cvy, cvz} = Enum.reduce(others, {0,0,0}, fn({other, _}, {acc_x, acc_y, acc_z}) ->
        {
          acc_x + gravity_compare(other.x, position.x),
          acc_y + gravity_compare(other.y, position.y),
          acc_z + gravity_compare(other.z, position.z)
        }
      end)
      {position, %Velocity{
        vx: velocity.vx + cvx,
        vy: velocity.vy + cvy,
        vz: velocity.vz + cvz
      }}
    end)
  end

  defp gravity_compare(a, b) when a > b, do: 1
  defp gravity_compare(a, b) when a < b, do: -1
  defp gravity_compare(a, b) when a == b, do: 0

  defp apply_velocity(state) do
    state
    |> Enum.map(fn({position, velocity}) ->
      {%Point{
        x: position.x + velocity.vx,
        y: position.y + velocity.vy,
        z: position.z + velocity.vz
      }, velocity}
    end)
  end

  def checkx([{a, va}, {b, vb}, {c, vc}, {d, vd}], [{e, ve}, {f, vf}, {g, vg}, {h, vh}]) do
    {a.x, b.x, c.x, d.x, va.vx, vb.vx, vc.vx, vd.vx} == {e.x, f.x, g.x, h.x, ve.vx, vf.vx, vg.vx, vh.vx}
  end

  def checky([{a, va}, {b, vb}, {c, vc}, {d, vd}], [{e, ve}, {f, vf}, {g, vg}, {h, vh}]) do
    {a.y, b.y, c.y, d.y, va.vy, vb.vy, vc.vy, vd.vy} == {e.y, f.y, g.y, h.y, ve.vy, vf.vy, vg.vy, vh.vy}
  end

  def checkz([{a, va}, {b, vb}, {c, vc}, {d, vd}], [{e, ve}, {f, vf}, {g, vg}, {h, vh}]) do
    {a.z, b.z, c.z, d.z, va.vz, vb.vz, vc.vz, vd.vz} == {e.z, f.z, g.z, h.z, ve.vz, vf.vz, vg.vz, vh.vz}
  end

  def lcm(loops) do
    x = Map.get(loops, :x)
    y = Map.get(loops, :y)
    z = Map.get(loops, :z)

    inter = Math.lcm(x, y)
    Math.lcm(inter, z)
  end
end
