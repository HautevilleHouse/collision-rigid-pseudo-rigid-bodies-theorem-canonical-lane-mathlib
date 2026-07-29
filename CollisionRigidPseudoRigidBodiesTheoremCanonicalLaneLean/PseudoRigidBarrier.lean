import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure PseudoRigidBarrierPackage where
  barrierPotentialDefined : Prop
  barrierActivationCondition : Prop
  barrierRestoringForceModel : Prop
  barrierPenetrationDepth : Prop
  barrierHysteresisPresent : Prop

structure PseudoRigidBarrierEvidence (B : PseudoRigidBarrierPackage) where
  barrierPotentialDefinedClosed : B.barrierPotentialDefined
  barrierActivationConditionClosed : B.barrierActivationCondition
  barrierRestoringForceModelClosed : B.barrierRestoringForceModel
  barrierPenetrationDepthClosed : B.barrierPenetrationDepth
  barrierHysteresisPresentClosed : B.barrierHysteresisPresent

def PseudoRigidBarrierClosed (B : PseudoRigidBarrierPackage) : Prop :=
  B.barrierPotentialDefined ∧ B.barrierActivationCondition ∧
  B.barrierRestoringForceModel ∧ B.barrierPenetrationDepth ∧
  B.barrierHysteresisPresent

theorem pseudo_rigid_barrier_closed_from_evidence
    (B : PseudoRigidBarrierPackage) (E : PseudoRigidBarrierEvidence B) :
    PseudoRigidBarrierClosed B := by
  exact And.intro E.barrierPotentialDefinedClosed
    (And.intro E.barrierActivationConditionClosed
      (And.intro E.barrierRestoringForceModelClosed
        (And.intro E.barrierPenetrationDepthClosed
          E.barrierHysteresisPresentClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse