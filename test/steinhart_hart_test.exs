defmodule SteinhartHartTest do
  use ExUnit.Case

  import SteinhartHart

  test "get_temperature_at_resistance/3" do
    resistances = {87_041, 27_326, 10_000}
    kelvins = {248.15, 273.15, 298.15}
    coefficients = calculate_coefficients(resistances, kelvins)

    assert 87_041 |> get_temperature_at_resistance(coefficients) |> Float.round(2) == 248.15
    assert 27_326 |> get_temperature_at_resistance(coefficients) |> Float.round(2) == 273.15
    assert 10_000 |> get_temperature_at_resistance(coefficients) |> Float.round(2) == 298.15
    assert 7_000 |> get_temperature_at_resistance(coefficients) == 307.90314140561975
  end
end
