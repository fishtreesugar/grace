forall (a : Type) .
forall (b : Type) .
forall (c : Type) .
forall (d : Fields) .
forall (e : Type) .
forall (f : Type) .
  { or: Bool -> Bool -> Bool
  , and: Bool -> Bool -> Bool
  , apply: (b -> a) -> b -> a
  , field: { foo: c, d } -> c
  , _if: Bool -> e -> e -> e
  , times: Natural -> Natural -> Natural
  , plus: Natural -> Natural -> Natural
  , append: Text -> Text -> Text
  , fold: Natural -> (f -> f) -> f -> f
  }
