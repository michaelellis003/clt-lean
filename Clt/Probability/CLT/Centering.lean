module

public import Mathlib.Algebra.BigOperators.Group.Finset.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Basic.Real.Basic

/-!
# Centering Random Variables

First steps towards the Central Limit Theorem. This module contains the
definition of centering.

This module formalizes the centering step in the proof
of the Central Limit Theorem.

Reference: Durrett, Probability: Theory and Examples,
5th edition, Theorem 3.4.1.
-/

public section

namespace Clt.Probability

/- Subtracting a constant from each observation subtracts `n * μ` from their
sum.

(X : ℕ → ℝ) (μ : ℝ) (n : ℕ)
  - Let X be a sequence of real numbers, μ be a real number, and n be a natural
    number.

  - Finset.range n is the set of natural numbers from 0 to n-1. So:
    1. ∑ i ∈ Finset.range n, (X i - μ) is the sum of the first n (0 to n-1)
      elements of X, each subtracted by μ.
    2. ∑ i ∈ Finset.range n, X i) - n * μ is the sum of the first n elements
      of X, minus n times μ.

  - simp is Lean's simplification tactic. It attempts to prove an equality by
    repeatedly rewriting expressions using a collection of known mathematical
    identities. (read more about this here -
      https://lean-lang.org/theorem_proving_in_lean4/Tactics/#using-the-simplifier

This is something about n being a natural number and how it is multipled with
μ which is a real number. Here n is cast to a real number
-/
theorem sum_centered (X : ℕ → ℝ) (μ : ℝ) (n : ℕ) :
    (∑ i ∈ Finset.range n, (X i - μ)) =
      (∑ i ∈ Finset.range n, X i) - (n : ℝ) * μ := by
  simp

end Clt.Probability

end
