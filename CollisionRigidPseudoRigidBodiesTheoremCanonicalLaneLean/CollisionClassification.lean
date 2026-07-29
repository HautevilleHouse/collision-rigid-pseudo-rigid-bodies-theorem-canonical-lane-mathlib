import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure CollisionClassificationPackage where
  rigidBodyCollisionType : Prop
  pseudoRigidDeformationModel : Prop
  restitutionLawComputed : Prop
  energyMomentumConservation : Prop
  impactDurationFinite : Prop

structure CollisionClassificationEvidence (C : CollisionClassificationPackage) where
  rigidBodyCollisionTypeClosed : C.rigidBodyCollisionType
  pseudoRigidDeformationModelClosed : C.pseudoRigidDeformationModel
  restitutionLawComputedClosed : C.restitutionLawComputed
  energyMomentumConservationClosed : C.energyMomentumConservation
  impactDurationFiniteClosed : C.impactDurationFinite

def CollisionClassificationClosed (C : CollisionClassificationPackage) : Prop :=
  C.rigidBodyCollisionType ∧ C.pseudoRigidDeformationModel ∧
  C.restitutionLawComputed ∧ C.energyMomentumConservation ∧
  C.impactDurationFinite

theorem collision_classification_closed_from_evidence
    (C : CollisionClassificationPackage) (E : CollisionClassificationEvidence C) :
    CollisionClassificationClosed C := by
  exact And.intro E.rigidBodyCollisionTypeClosed
    (And.intro E.pseudoRigidDeformationModelClosed
      (And.intro E.restitutionLawComputedClosed
        (And.intro E.energyMomentumConservationClosed
          E.impactDurationFiniteClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse