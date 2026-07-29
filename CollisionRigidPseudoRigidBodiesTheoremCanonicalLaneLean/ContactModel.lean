import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.PseudoRigidBodyDeformation

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ContactModelPackage where
  bodyPair : PseudoRigidBodyDeformationPackage × PseudoRigidBodyDeformationPackage
  contactGeometry : Prop
  penetrationDepth : Prop
  contactForces : Prop
  frictionModel : Prop
  adhesionModel : Prop

structure ContactModelEvidence (pkg : ContactModelPackage) where
  contactGeometryClosed : pkg.contactGeometry
  penetrationDepthClosed : pkg.penetrationDepth
  contactForcesClosed : pkg.contactForces
  frictionModelClosed : pkg.frictionModel
  adhesionModelClosed : pkg.adhesionModel

def ContactModelClosed (pkg : ContactModelPackage) : Prop :=
  pkg.contactGeometry ∧ pkg.penetrationDepth ∧
  pkg.contactForces ∧ pkg.frictionModel ∧ pkg.adhesionModel

theorem contact_model_closed_from_evidence (pkg : ContactModelPackage)
    (E : ContactModelEvidence pkg) : ContactModelClosed pkg := by
  exact And.intro E.contactGeometryClosed
    (And.intro E.penetrationDepthClosed
      (And.intro E.contactForcesClosed
        (And.intro E.frictionModelClosed E.adhesionModelClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse