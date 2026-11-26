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

/-- The sum of the first n natural numbers. -/
theorem sum_naturals (n : ℕ) :
  2 * (∑ i ∈ Finset.range (n + 1), i) =
    n * (n + 1) := by
  induction n with
  | zero =>
    simp
  | succ n ih =>
    rw [Finset.sum_range_succ]
    rw [Nat.mul_add]
    rw [ih]
    ring

/-- The sum of the first n odd natural numbers. -/
theorem sum_odd_naturals (n : ℕ) :
    (∑ i ∈ Finset.range n, (2 * i + 1)) = n^2 := by
  induction n with
  | zero =>
    simp
  | succ n ih =>
    rw [Finset.sum_range_succ]
    rw [ih]
    ring
