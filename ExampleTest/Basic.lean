module

import Clt.Basic

/-!
# Basic Tests

Regression tests for the CLT project.
-/

example (n : Nat) : n + 0 = n := by
  exact Nat.add_zero n
