defmodule DBKV.BooleanMatchSpec do
  @moduledoc """
  A collection of convenient match spec generators.
  """

  require Ex2ms

  def key_range(min_key, max_key, opts) do
    max_key_inclusive = Keyword.get(opts, :max_key_inclusive, true)

    if max_key_inclusive do
      Ex2ms.fun do
        {k, v} = kv when ^min_key <= k and k <= ^max_key -> true
      end
    else
      Ex2ms.fun do
        {k, v} = kv when ^min_key <= k and k < ^max_key -> true
      end
    end
  end

  def value_range(min_value, max_value, opts) do
    max_value_inclusive = Keyword.get(opts, :max_value_inclusive, true)

    if max_value_inclusive do
      Ex2ms.fun do
        {k, v} = kv when ^min_value <= v and v <= ^max_value -> true
      end
    else
      Ex2ms.fun do
        {k, v} = kv when ^min_value <= v and v < ^max_value -> true
      end
    end
  end

  def min_key(min_key) do
    Ex2ms.fun do
      {k, v} = kv when ^min_key <= k -> true
    end
  end

  def max_key(max_key, opts) do
    max_key_inclusive = Keyword.get(opts, :max_key_inclusive, true)

    if max_key_inclusive do
      Ex2ms.fun do
        {k, v} = kv when k <= ^max_key -> true
      end
    else
      Ex2ms.fun do
        {k, v} = kv when k < ^max_key -> true
      end
    end
  end

  def min_value(min_value) do
    Ex2ms.fun do
      {k, v} = kv when ^min_value <= v -> true
    end
  end

  def max_value(max_value, opts) do
    max_value_inclusive = Keyword.get(opts, :max_value_inclusive, true)

    if max_value_inclusive do
      Ex2ms.fun do
        {k, v} = kv when v <= ^max_value -> true
      end
    else
      Ex2ms.fun do
        {k, v} = kv when v < ^max_value -> true
      end
    end
  end
end