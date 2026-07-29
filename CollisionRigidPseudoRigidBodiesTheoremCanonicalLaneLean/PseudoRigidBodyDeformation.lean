import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.RigidBodyDynamics

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure PseudoRigidBodyDeformationPackage where
  body : RigidBodyDynamicsPackage
  deformationMechanism : Prop
  complianceModel : Prop
  stiffnessParameters : Prop
  energyStored : Prop
  yieldCondition : Prop

structure PseudoRigidBodyDeformationEvidence (pkg : PseudoRigidBodyDeformationPackage) where
  deformationMechanismClosed : pkg.deformationMechanism
  complianceModelClosed : pkg.complianceModel
  stiffnessParametersClosed : pkg.stiffnessParameters
  energyStoredClosed : pkg.energyStored
  yieldConditionClosed : pkg.yieldCondition

def PseudoRigidBodyDeformationClosed (pkg : PseudoRigidBodyDeformationPackage) : Prop :=
  pkg.deformationMechanism ∧ pkg.complianceModel ∧
  pkg.stiffnessParameters ∧ pkg.energyStored ∧ pkg.yieldCondition

theorem pseudo_rigid_body_deformation_closed_from_evidence
    (pkg : PseudoRigidBodyDeformationPackage)
    (E : PseudoRigidBodyDeformationEvidence pkg) : PseudoRigidBodyDeformationClosed pkg := by
  exact And.intro E.deformationMechanismClosed
    (And.intro E.complianceModelClosed
      (And.intro E.stiffnessParametersClosed
        (And.intro E.energyStoredClosed E.yieldConditionClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse