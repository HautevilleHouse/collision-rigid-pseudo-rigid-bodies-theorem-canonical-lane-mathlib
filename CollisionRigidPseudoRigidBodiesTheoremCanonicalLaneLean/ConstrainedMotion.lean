import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.EnergyDissipation

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ConstrainedMotionPackage where
  energyDissipation : EnergyDissipationPackage
  constraintEquations : Prop
  lagrangeMultipliers : Prop
  constrainedDynamics : Prop
  stabilityAnalysis : Prop
  motionPredictions : Prop

structure ConstrainedMotionEvidence (pkg : ConstrainedMotionPackage) where
  constraintEquationsClosed : pkg.constraintEquations
  lagrangeMultipliersClosed : pkg.lagrangeMultipliers
  constrainedDynamicsClosed : pkg.constrainedDynamics
  stabilityAnalysisClosed : pkg.stabilityAnalysis
  motionPredictionsClosed : pkg.motionPredictions

def ConstrainedMotionClosed (pkg : ConstrainedMotionPackage) : Prop :=
  pkg.constraintEquations ∧ pkg.lagrangeMultipliers ∧
  pkg.constrainedDynamics ∧ pkg.stabilityAnalysis ∧ pkg.motionPredictions

theorem constrained_motion_closed_from_evidence (pkg : ConstrainedMotionPackage)
    (E : ConstrainedMotionEvidence pkg) : ConstrainedMotionClosed pkg := by
  exact And.intro E.constraintEquationsClosed
    (And.intro E.lagrangeMultipliersClosed
      (And.intro E.constrainedDynamicsClosed
        (And.intro E.stabilityAnalysisClosed E.motionPredictionsClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse