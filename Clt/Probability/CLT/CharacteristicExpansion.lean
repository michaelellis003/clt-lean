module

public import Mathlib.Basic.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds

/-!
# Characteristic Function Expansion

Formalization of Durrett's Theorem 3.3.20 from Probability: Theory and
Examples, 5th edition.

We first study the
-/

public section

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

linarith is a tactic that solves linear inequalities and equalities.

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

/-- The absolute value of the cosine remainder is at most `x² / 2`.

Our cosRemainder_bounds theorem has two parts. They are defined as 'h' using
the statement have h := cosRemainder_bounds x in this proof and we can access
the two parts using h.1 for 0 ≤ cosRemainder and h.2 for cosRemainder x ≤ x ^ 2 / 2.

rw [abs_of_nonneg h.1] says we can rewrite the |cosRemainder x| ≤ x ^ 2 / 2 theorem using
abs_of_nonneg (if  a ≥ 0 then |a| = a) and 0 ≤ cosRemainder to transform
|cosRemainder x| into cosRemainder x. Then we can use h.2 to prove the inequality
cosRemainder x ≤ x ^ 2 / 2 which we have shown is equivalent to
|cosRemainder x| ≤ x ^ 2 / 2.
-/
theorem abs_cosRemainder_le (x : ℝ) :
    |cosRemainder x| ≤ x ^ 2 / 2 := by
  have h := cosRemainder_bounds x
  rw [abs_of_nonneg h.1]
  exact h.2

/-- The cosine remainder is an even function.
Real.cos (-x) - 1 + (-x)^ 2 / 2 = Real.cos x - 1 + x ^ 2 / 2
-/
theorem cosRemainder_neg (x : ℝ) :
    cosRemainder (-x) = cosRemainder x := by
  simp [cosRemainder, Real.cos_neg]

/- A cubic bound for nonnegative inputs extends to all real inputs.

Assuming that for all nonnegative real numbers `y`, the cosine remainder is
bounded by `y^3 / 6`, we need to show that
`|cosRemainder x| ≤ |x|^3 / 6` for all real numbers `x`.

We first use the first part of cosRemainder_bounds (0 ≤ cosRemainder) and the
abs_of_nonneg to show that |cosRemainder x| = cosRemainder x for all x in ℝ.
So we know need to show
`cosRemainder x ≤ |x|^3 / 6` for all real numbers `x`.

Then we use rcases le_total 0 x with hx | hx to split the proof into two cases:
1. Case 1: x ≥ 0 or
2. Case 2: x ≤ 0

For Case 1, x ≥ 0 implies |x| = x (where we apply abs_of_nonneg), so we can
rewrite the goal as `cosRemainder x ≤ x^3 / 6`. This is what we are assume
so - exact h x hx - gives our proof for this case.

For Case 2, Since x ≤ 0, we know -x ≥ 0. Given, cosRemainder_neg, the cosine
remainder is even: R(-x) = R(x). And since x ≤ 0, we have |x| = -x.
So we can rewrite the goal as `cosRemainder (-x) ≤ (-x)^3 / 6`.
Since -x is nonnegative, we can apply our assumption h to -x to conclude that
`cosRemainder (-x) ≤ (-x)^3 / 6`. This completes the proof for this case.

Therefore we have shown that for all real numbers x, |cosRemainder x| ≤ |x|^3 / 6.
-/
/-- A cubic bound for nonnegative inputs extends to all real inputs. -/
theorem abs_cosRemainder_le_cubic_of_nonneg
    (h : ∀ y : ℝ, 0 ≤ y → cosRemainder y ≤ y ^ 3 / 6)
    (x : ℝ) :
    |cosRemainder x| ≤ |x| ^ 3 / 6 := by
  rw [abs_of_nonneg (cosRemainder_bounds x).1]
  rcases le_total 0 x with hx_nonneg | hx_nonpos
  · -- Case 1: x ≥ 0
    rw [abs_of_nonneg hx_nonneg]
    exact h x hx_nonneg
  · -- Case 2: x ≤ 0
    have hnegx_nonneg : 0 ≤ -x := neg_nonneg.mpr hx_nonpos
    -- The cosine remainder is even: R(-x) = R(x). Rewrite R(x) as R(-x).
    rw [← cosRemainder_neg x]
    -- Since x ≤ 0, we have |x| = -x.
    rw [abs_of_nonpos hx_nonpos]
    -- Apply our assumption h to -x, which is nonnegative.
    exact h (-x) hnegx_nonneg

/-
We have that if for all nonnegative real numbers `y`, the cosine remainder is
bounded by `y^3 / 6` then `|cosRemainder x| ≤ |x|^3 / 6` for all real numbers `x`.

So now we need to for all nonnegative real numbers `y`, the cosine remainder is
bounded by `y^3 / 6` and that will give us `|cosRemainder x| ≤ |x|^3 / 6`
for all real numbers `x`.
-/
-- theorem cosRemainder_le_cubic_of_nonneg
--     (x : ℝ) (hx : 0 ≤ x) :
--     cosRemainder x ≤ x ^ 3 / 6 := by

/-- The remainder after the linear approximation of sine. -/
noncomputable def sinRemainder (x : ℝ) : ℝ :=
  Real.sin x - x


/-- The sine remainder is bounded by the cubic Taylor error.

abs_sub_comm shows that |a - b| = |b - a|
Real.abs_sub_sin_le shows that |x - sin x| ≤ |x|^3 / 6 for all real numbers x.

Combining these two results, we can conclude that |sinRemainder x| ≤ |x|^3 / 6
for all real numbers x.
-/
theorem abs_sinRemainder_le (x : ℝ) :
    |sinRemainder x| ≤ |x| ^ 3 / 6 := by
  unfold sinRemainder
  rw [abs_sub_comm]
  exact Real.abs_sub_sin_le x


end Clt.Probability
