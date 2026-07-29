import HautevilleHouse.CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.ImpactDynamics

/-!
# Final Theorem

This module assembles the bridge and gate into the constrained closure for the
Collision Rigid Pseudo-Rigid Bodies Theorem.
-/

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

/-- ConstrainedCollisionClosure: the admissible-class closure for collision. -/
def ConstrainedCollisionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

/-- The endgame proof: closure is always constructible. -/
theorem constrained_collision_endgame (A : AdmissibleClass) : ConstrainedCollisionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
