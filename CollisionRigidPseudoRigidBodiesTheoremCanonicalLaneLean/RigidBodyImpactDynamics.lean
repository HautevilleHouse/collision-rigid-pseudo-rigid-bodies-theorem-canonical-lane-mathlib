import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure RigidBodyImpactDynamicsPackage where
  preImpactVelocity : Vector ℝ 3
  postImpactVelocity : Vector ℝ 3
  coefficientOfRestitution : ℝ
  impactForce : ℝ → Vector ℝ 3
  momentumConservation : Prop
  energyDissipation : Prop
  signoriniCondition : Prop

structure RigidBodyImpactDynamicsEvidence (D : RigidBodyImpactDynamicsPackage) where
  momentumConservationClosed : D.momentumConservation
  energyDissipationClosed : D.energyDissipation
  signoriniConditionClosed : D.signoriniCondition

def RigidBodyImpactDynamicsClosed (D : RigidBodyImpactDynamicsPackage) : Prop :=
  D.momentumConservation ∧ D.energyDissipation ∧ D.signoriniCondition

theorem rigid_body_impact_dynamics_closed_from_evidence
    (D : RigidBodyImpactDynamicsPackage) (E : RigidBodyImpactDynamicsEvidence D) :
    RigidBodyImpactDynamicsClosed D := by
  exact And.intro E.momentumConservationClosed (And.intro E.energyDissipationClosed E.signoriniConditionClosed)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse