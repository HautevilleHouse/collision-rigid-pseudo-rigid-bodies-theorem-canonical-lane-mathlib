import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure PseudoRigidContactModelPackage where
  contactStiffness : ℝ
  dampingCoefficient : ℝ
  penetrationDepth : ℝ → ℝ
  normalForce : ℝ → Vector ℝ 3
  tangentialForce : ℝ → Vector ℝ 3
  hertzianContact : Prop
  coulombFriction : Prop
  noPenetration : Prop

structure PseudoRigidContactModelEvidence (C : PseudoRigidContactModelPackage) where
  hertzianContactClosed : C.hertzianContact
  coulombFrictionClosed : C.coulombFriction
  noPenetrationClosed : C.noPenetration

def PseudoRigidContactModelClosed (C : PseudoRigidContactModelPackage) : Prop :=
  C.hertzianContact ∧ C.coulombFriction ∧ C.noPenetration

theorem pseudo_rigid_contact_model_closed_from_evidence
    (C : PseudoRigidContactModelPackage) (E : PseudoRigidContactModelEvidence C) :
    PseudoRigidContactModelClosed C := by
  exact And.intro E.hertzianContactClosed (And.intro E.coulombFrictionClosed E.noPenetrationClosed)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse