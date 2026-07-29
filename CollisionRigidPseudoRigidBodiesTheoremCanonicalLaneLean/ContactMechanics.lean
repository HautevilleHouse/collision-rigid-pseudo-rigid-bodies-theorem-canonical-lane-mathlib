import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ContactMechanicsPackage where
  contactSurface : Type u
  normalForce : Prop
  tangentialForce : Prop
  frictionModel : Prop
  contactPressure : Prop
  adhesionContribution : Prop
  surfaceRoughness : Prop

structure ContactMechanicsEvidence (C : ContactMechanicsPackage) where
  normalForceClosed : C.normalForce
  tangentialForceClosed : C.tangentialForce
  frictionModelClosed : C.frictionModel
  contactPressureClosed : C.contactPressure
  adhesionContributionClosed : C.adhesionContribution
  surfaceRoughnessClosed : C.surfaceRoughness

def ContactMechanicsClosed (C : ContactMechanicsPackage) : Prop :=
  C.normalForce ∧ C.tangentialForce ∧ C.frictionModel ∧
  C.contactPressure ∧ C.adhesionContribution ∧ C.surfaceRoughness

theorem contact_mechanics_closed_from_evidence (C : ContactMechanicsPackage)
    (E : ContactMechanicsEvidence C) : ContactMechanicsClosed C := by
  exact And.intro E.normalForceClosed
    (And.intro E.tangentialForceClosed
      (And.intro E.frictionModelClosed
        (And.intro E.contactPressureClosed
          (And.intro E.adhesionContributionClosed E.surfaceRoughnessClosed))))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
