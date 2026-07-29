import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure CollisionResolutionAlgorithmPackage where
  collisionDetection : Prop
  impactTimeDetermination : Prop
  velocityUpdate : Prop
  positionCorrection : Prop
  iterativeSolve : Prop
  convergenceCondition : Prop
  uniquenessSolution : Prop

structure CollisionResolutionAlgorithmEvidence (A : CollisionResolutionAlgorithmPackage) where
  collisionDetectionClosed : A.collisionDetection
  impactTimeDeterminationClosed : A.impactTimeDetermination
  velocityUpdateClosed : A.velocityUpdate
  positionCorrectionClosed : A.positionCorrection
  iterativeSolveClosed : A.iterativeSolve
  convergenceConditionClosed : A.convergenceCondition
  uniquenessSolutionClosed : A.uniquenessSolution

def CollisionResolutionAlgorithmClosed (A : CollisionResolutionAlgorithmPackage) : Prop :=
  A.collisionDetection ∧ A.impactTimeDetermination ∧ A.velocityUpdate ∧
  A.positionCorrection ∧ A.iterativeSolve ∧ A.convergenceCondition ∧ A.uniquenessSolution

theorem collision_resolution_algorithm_closed_from_evidence
    (A : CollisionResolutionAlgorithmPackage) (E : CollisionResolutionAlgorithmEvidence A) :
    CollisionResolutionAlgorithmClosed A := by
  exact And.intro E.collisionDetectionClosed
    (And.intro E.impactTimeDeterminationClosed
      (And.intro E.velocityUpdateClosed
        (And.intro E.positionCorrectionClosed
          (And.intro E.iterativeSolveClosed
            (And.intro E.convergenceConditionClosed E.uniquenessSolutionClosed)))))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse