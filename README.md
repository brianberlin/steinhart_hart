# SteinhartHart

SteinhartHart allows easy coefficient and temperature calculations

Code adapted from: https://www.npmjs.com/package/steinhart-hart

## Example Usage

```elixir
# celsius = -25 (248.15 in Kelvin) ---- resistance = 87041
# celsius = 0 (273.15 in Kelvin) ---- resistance = 27326
# celsius = 25 (298.15 in Kelvin) ---- resistance = 10000
iex(1)> coefficients = SteinhartHart.calculate_coefficients({87041, 27326, 10000}, {248.15, 273.15, 298.15})
{8.975539782833824e-4, 2.501791479471131e-4, 1.948344036705597e-7}
iex(2)> SteinhartHart.get_temperature_at_resistance(7000, coefficients, :celsius)
34.75314140561977
```

## Installation

```elixir
def deps do
  [
    {:steinhart_hart, github: "brianberlin/steinhart_hart"}
  ]
end
```
