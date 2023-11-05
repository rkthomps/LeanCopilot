import Lean
import LeanInfer

open Lean
open LeanInfer

set_option autoImplicit false

#eval getConfig

def cfg : Config := {
  backend := .native $ .ct2 {
    generatorUrl? := some ⟨"kaiyuy", "ct2-leandojo-lean4-tacgen-byt5-small"⟩,
    encoderUrl? := some ⟨"kaiyuy", "ct2-leandojo-lean4-retriever-byt5-small"⟩
  },
  decoding := {numReturnSequences := 64}
}

#eval setConfig cfg

example (n : Nat) : Nat.gcd n n = n := by
  select_premises
  sorry

example (a b c : Nat) : a + b + c = a + c + b := by
  suggest_tactics!
  sorry
