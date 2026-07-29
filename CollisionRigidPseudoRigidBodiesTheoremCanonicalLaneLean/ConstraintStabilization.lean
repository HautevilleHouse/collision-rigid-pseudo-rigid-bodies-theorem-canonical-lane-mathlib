import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ConstraintStabilizationPackage where
  constraintJacobian : Matrix ℝ 3 ℝ 3
  lagrangeMultiplier : ℝ → ℝ
  stabilizationForce : ℝ → Vector ℝ 3
  constraintSatisfaction : Prop
  driftCorrection : Prop
  stabilityBound : Prop

structure ConstraintStabilizationEvidence (C : ConstraintStabilizationPackage) where
  constraintSatisfactionClosed : C.constraintSatisfaction
  driftCorrectionClosed : C.driftCorrection
  stabilityBoundClosed : C.stabilityBound

def ConstraintStabilizationClosed (C : ConstraintStabilizationPackage) : Prop :=
  C.constraintSatisfaction ∧ C.driftCorrection ∧ C.stabilityBound

theorem constraint_stabilization_closed_from_evidence
    (C : ConstraintStabilizationPackage) (E : ConstraintStabilizationEvidence C) :
    ConstraintStabilizationClosed C := by
  exact And.intro E.constraintSatisfactionClosed (And.intro E.driftCorrectionClosed E.stabilityBoundClosed)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse