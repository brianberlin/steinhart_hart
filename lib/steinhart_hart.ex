defmodule SteinhartHart do
  @moduledoc """
  Steinhart–Hart equation

  The equation is often used to derive a precise temperature of a
  thermistor, since it provides a closer approximation to actual
  temperature than simpler equations, and is useful over the entire
  working temperature range of the sensor. Steinhart–Hart coefficients
  are usually published by thermistor manufacturers.
  """

  @spec calculate_coefficients(
          resistance_values :: {number(), number(), number()},
          temperature_values :: {number(), number(), number()}
        ) :: coefficients :: {number(), number(), number()}
  def calculate_coefficients(resistance_values, temperature_values) do
    {ra, rb, rc} = resistance_values
    {ta, tb, tc} = temperature_values

    l1 = :math.log(ra)
    l2 = :math.log(rb)
    l3 = :math.log(rc)

    y1 = 1 / ta
    y2 = 1 / tb
    y3 = 1 / tc

    u2 = (y2 - y1) / (l2 - l1)
    u3 = (y3 - y1) / (l3 - l1)

    c = (u3 - u2) / (l3 - l2) * :math.pow(l1 + l2 + l3, -1)
    b = u2 - c * (:math.pow(l1, 2) + l1 * l2 + :math.pow(l2, 2))
    a = y1 - (b + :math.pow(l1, 2) * c) * l1
    {a, b, c}
  end

  @spec get_temperature_at_resistance(
          resistance :: number(),
          coefficients :: {number(), number(), number()}
        ) :: temperature :: number()
  def get_temperature_at_resistance(resistance, {a, b, c}) do
    1 / (a + b * :math.log(resistance) + c * :math.pow(:math.log(resistance), 3))
  end
end
