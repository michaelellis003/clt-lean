/-
Copyright (c) 2026 Michael Ellis. All rights reserved.
Released under the MIT license as described in the file LICENSE.
Authors: Michael Ellis
-/

module

public import Mathlib

/-!
A very simple example of a Lean file.
-/

public section

/-- The square of the sum of two real numbers. -/
theorem square_add (x y : ℝ) :
    (x + y)^2 = x^2 + 2*x*y + y^2 := by
  ring
