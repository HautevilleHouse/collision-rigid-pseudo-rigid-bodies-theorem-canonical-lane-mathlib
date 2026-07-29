import HautevilleHouse.CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.KinematicsPackage

/-!
# Impact Dynamics Package

This module models the collision (impact) event itself, including the contact
laws, impulse transfer, and deformation update for the pseudo-rigid body.
-/

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

/-- The impact event captures the exchange of momentum and energy. -/
structure ImpactEvent where
  normalImpulse : ℝ
  tangentialImpulse : ℝ × ℝ
  coefficientOfRestitution : ℝ
  frictionCoefficient : ℝ
  restitutionInRange : coefficientOfRestitution ≥ 0 ∧ coefficientOfRestitution ≤ 1
  frictionInRange : frictionCoefficient ≥ 0 ∧ frictionCoefficient ≤ 1

/-- Post-collision deformation of the pseudo-rigid body. -/
structure PostCollisionDeformation where
  newDeformationGradient : ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ
  newDeformationVelocity : ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ
  energyDissipated : ℝ
  energyDissipatedNonnegative : energyDissipated ≥ 0

/-- Impact dynamics package assembles the impact event and its consequences. -/
structure ImpactDynamicsPackage (K : KinematicsPackage) where
  impactEvent : ImpactEvent
  postCollision : PostCollisionDeformation
  impulseMomentumBalance : Prop
  impulseMomentumBalanceClosed : impulseMomentumBalance

/-- Evidence that the impact dynamics satisfy the physical laws. -/
structure ImpactDynamicsEvidence {K : KinematicsPackage}
    (I : ImpactDynamicsPackage K) where
  restitutionValid : I.impactEvent.restitutionInRange
  frictionValid : I.impactEvent.frictionInRange
  energyDissipationValid : I.postCollision.energyDissipatedNonnegative
  balanceHolds : I.impulseMomentumBalance

/-- ImpactDynamicsClosed: the closure condition. -/
def ImpactDynamicsClosed {K : KinematicsPackage} (I : ImpactDynamicsPackage K) : Prop :=
  I.impactEvent.restitutionInRange ∧ I.impactEvent.frictionInRange ∧
  I.postCollision.energyDissipatedNonnegative ∧ I.impulseMomentumBalance

theorem impact_dynamics_closed_from_evidence
    {K : KinematicsPackage} (I : ImpactDynamicsPackage K)
    (E : ImpactDynamicsEvidence I) : ImpactDynamicsClosed I := by
  exact And.intro E.restitutionValid (And.intro E.frictionValid (And.intro E.energyDissipationValid E.balanceHolds))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
