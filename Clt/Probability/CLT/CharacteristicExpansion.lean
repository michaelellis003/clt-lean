module

import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds

/-!
# Characteristic Function Expansion

Formalization of Durrett's Theorem 3.3.20 from Probability: Theory and
Examples, 5th edition.

We first study the
-/

namespace Clt.Probability

/-- The remainder after the quadratic approximation of cosine.

Define a function, `cosRemainder`, from ℝ to ℝ, which takes a real number `x`
and returns the difference between the cosine of `x` and the quadratic
approximation of cosine at zero, which is `1 - x^2 / 2`.
-/
noncomputable def cosRemainder (x : ℝ) : ℝ :=
  Real.cos x - 1 + x ^ 2 / 2


/-- The cosine remainder vanishes at zero.

Plug in 0 into the definition of `cosRemainder` and you get 0.
-/
theorem cosRemainder_zero :
    cosRemainder 0 = 0 := by
  simp [cosRemainder]

/-- The cosine remainder is nonnegative and bounded by `x² / 2`.

We use some results in Mathlib:
- Real.one_sub_sq_div_two_le_cos which states that `1 - x^2 / 2 ≤ cos x` for all real numbers `x`.
- Real.cos_le_one which states that `cos x ≤ 1` for all real numbers `x`.
- constructor then splits the the goal into two subgoals:
  1. Prove that `cosRemainder x ≥ 0` for all real numbers `x`.
  2. Prove that `cosRemainder x ≤ x^2 / 2` for all real numbers `x`.

- For the first subgoal:
   - `unfold cosRemainder` replaces the definition with
     `cos x - 1 + x^2 / 2`.
   - `linarith` uses `h_lower` to prove the inequality by
     rearranging `1 - x^2 / 2 ≤ cos x`.

- For the second subgoal:
   - `unfold cosRemainder` again expands the definition.
   - `linarith` uses `h_upper`, which states `cos x ≤ 1`,
     to prove `cos x - 1 + x^2 / 2 ≤ x^2 / 2`.

Together, these establish that for every real number `x`:

  `0 ≤ cosRemainder x ≤ x^2 / 2`.
-/
theorem cosRemainder_bounds (x : ℝ) :
    0 ≤ cosRemainder x ∧ cosRemainder x ≤ x ^ 2 / 2 := by
  have h_lower := Real.one_sub_sq_div_two_le_cos (x := x)
  have h_upper := Real.cos_le_one x
  constructor
  · unfold cosRemainder
    linarith
  · unfold cosRemainder
    linarith


end Clt.Probability
