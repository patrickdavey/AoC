defmodule AOC.Runner do
  @ore_limit 1000000000000

  def part_1(reactions \\ structured_data) do
    fuel_reaction = Map.fetch!(reactions, "FUEL")
    add = Enum.map(fuel_reaction.dependencies, fn({c, a}) -> {c, a * fuel_reaction.quantity} end)
    find_min_reactions(add, reactions, %{})
    |> Enum.reduce(%{}, fn({elem, quantity}, acc) -> Map.update(acc, elem, quantity, &(&1 + quantity)) end)
    |> Enum.reduce(0, fn(elem, acc) -> ore_total(elem, acc, reactions) end)
  end

  def part_2(reactions \\ structured_data) do
    find_best_fuel(reactions, {0, 0}, {1, part_1(reactions)})
  end

  defp find_best_fuel(reactions, {lower_fuel, a}, {upper_fuel, a}) do
    lower_fuel
  end

  defp find_best_fuel(reactions, {lower_fuel, lower_ore}, {upper_fuel, upper_ore}) do
    IO.inspect({lower_fuel, upper_fuel})
    cond do
      upper_ore <= @ore_limit ->
        next_fuel = upper_fuel * 2
        next_ore = part_1(Map.update!(reactions, "FUEL", &(%{&1 | quantity: next_fuel})))
        find_best_fuel(reactions, {upper_fuel, upper_ore}, {next_fuel, next_ore})
      true ->
        # we have exceeded our fuel allowance. binary? search
        next_fuel = lower_fuel + floor((upper_fuel - lower_fuel) / 2)
        next_ore = part_1(Map.update!(reactions, "FUEL", &(%{&1 | quantity: next_fuel})))
        find_best_fuel(reactions, {lower_fuel, lower_ore}, {next_fuel, next_ore})
    end
  end

  defp structured_data do
    AOC.Parser.parse
  end

  defp find_min_reactions(current = [{chem, amount} | t], reactions, leftovers) do
    cond do
      only_ore_required_all(current, reactions) ->
        consolodate(current)
      only_ore?(Map.fetch!(reactions, chem)) ->
        { leftovers, amount } = use_surplus(chem, amount, leftovers)
        find_min_reactions(t ++ [{chem, amount}], reactions, leftovers)
      true ->
        {next, leftovers} = current |> expand_dependencies(reactions, leftovers)
        find_min_reactions(next, reactions, leftovers)
    end
  end

  defp only_ore_required_all(current, reactions) do
    current
    |> Enum.map(&(elem(&1, 0)))
    |> Enum.map(&(Map.fetch!(reactions, &1)))
    |> Enum.all?(&only_ore?/1)
  end

  defp only_ore?(r) do
    r.dependencies |> length == 1 && elem(Enum.at(r.dependencies,0), 0) == "ORE"
  end

  def consolodate(list) do
    list
    |> Enum.reduce(%{}, fn({k, v}, acc) -> Map.update(acc, k, v, &(v + &1)) end)
    |> Enum.to_list
  end

  defp ore_total({elem, requirement}, acc, reactions) do
    reaction = Map.fetch!(reactions, elem)
    [{"ORE", amount}] = reaction.dependencies
    quantity = reaction.quantity

    acc + (ceil(requirement/quantity) * amount)
  end

  def expand_dependencies([{chem, amount} | t], reactions, leftovers) do
    { leftovers, amount } = use_surplus(chem, amount, leftovers)
    if (amount > 0) do
      reaction = Map.fetch!(reactions, chem)
      requirement = ceil(amount/reaction.quantity)
      add = Enum.map(reaction.dependencies, fn({c, a}) -> {c, a * requirement} end)
      extra = reaction.quantity * requirement - amount
      { consolodate(t ++ add), Map.update(leftovers, chem, extra, &(&1 + extra)) }
    else
      { t, leftovers }
    end
  end

  def use_surplus(chem, amount, leftovers) do
    cond do
      Map.get(leftovers, chem, 0) >= amount ->
        { Map.update!(leftovers, chem, &(&1 - amount)), 0 }
      Map.get(leftovers, chem, 0) < amount ->
        { Map.put(leftovers, chem, 0), amount - Map.get(leftovers, chem, 0) }
    end
  end
end
