import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure PseudoRigidDeformationPackage where
  bodyGeometry : Type u
  materialModel : Type v
  stiffnessTensor : Prop
  deformationGradient : Prop
  internalStress : Prop
  elasticEnergy : Prop
  dissipationMechanism : Prop
  yieldCondition : Prop
  recoveryModel : Prop

structure PseudoRigidDeformationEvidence (D : PseudoRigidDeformationPackage) where
  stiffnessTensorClosed : D.stiffnessTensor
  deformationGradientClosed : D.deformationGradient
  internalStressClosed : D.internalStress
  elasticEnergyClosed : D.elasticEnergy
  dissipationMechanismClosed : D.dissipationMechanism
  yieldConditionClosed : D.yieldCondition
  recoveryModelClosed : D.recoveryModel

def PseudoRigidDeformationClosed (D : PseudoRigidDeformationPackage) : Prop :=
  D.stiffnessTensor ∧ D.deformationGradient ∧ D.internalStress ∧
  D.elasticEnergy ∧ D.dissipationMechanism ∧ D.yieldCondition ∧ D.recoveryModel

theorem pseudo_rigid_deformation_closed_from_evidence
    (D : PseudoRigidDeformationPackage) (E : PseudoRigidDeformationEvidence D) :
    PseudoRigidDeformationClosed D := by
  exact And.intro E.stiffnessTensorClosed
    (And.intro E.deformationGradientClosed
      (And.intro E.internalStressClosed
        (And.intro E.elasticEnergyClosed
          (And.intro E.dissipationMechanismClosed
            (And.intro E.yieldConditionClosed E.recoveryModelClosed)))))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
