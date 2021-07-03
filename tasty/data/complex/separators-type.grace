forall (a : Type) .
forall (b : Alternatives) .
forall (c : Fields) .
forall (d : Alternatives) .
  { example0: List Natural
  , example1: { x: Natural, y: a -> < True: a | b > }
  , example2: { x: Integer, y: Bool, a } -> { x: Integer, y: Bool, c }
  , example3: < A: Natural | B: Bool > -> < A: Natural | B: Bool >
  , example3: < A: Natural | B: Bool | a > -> < A: Natural | B: Bool | d >
  }
