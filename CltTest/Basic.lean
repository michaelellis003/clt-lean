module

import Clt.Basic

/-!
# Basic Tests

Regression tests for the CLT project.
-/

set_option linter.hashCommand false

#guard 2 + 2 == 4

example (n : Nat) : n + 0 = n := by
  exact Nat.add_zero n
