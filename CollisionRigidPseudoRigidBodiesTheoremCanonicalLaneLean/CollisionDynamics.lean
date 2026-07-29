import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure CollisionDynamicsPackage where
  rigidBodySpace : Type u
  pseudoRigidBodySpace : Type v
  collisionEvent : Type w
  impactDynamics : Prop
  deformationModel : Prop
  restitutionLaw : Prop
  energyTransfer : Prop
  momentumConservation : Prop
  timeOfContact : Prop

structure CollisionDynamicsEvidence (C : CollisionDynamicsPackage) where
  impactDynamicsClosed : C.impactDynamics
  deformationModelClosed : C.deformationModel
  restitutionLawClosed : C.restitutionLaw
  energyTransferClosed : C.energyTransfer
  momentumConservationClosed : C.momentumConservation
  timeOfContactClosed : C.timeOfContact

def CollisionDynamicsClosed (C : CollisionDynamicsPackage) : Prop :=
  C.impactDynamics ∧ C.deformationModel ∧ C.restitutionLaw ∧
  C.energyTransfer ∧ C.momentumConservation ∧ C.timeOfContact

theorem collision_dynamics_closed_from_evidence (C : CollisionDynamicsPackage)
    (E : CollisionDynamicsEvidence C) : CollisionDynamicsClosed C := by
  exact And.intro E.impactDynamicsClosed
    (And.intro E.deformationModelClosed
      (And.intro E.restitutionLawClosed
        (And.intro E.energyTransferClosed
          (And.intro E.momentumConservationClosed E.timeOfContactClosed))))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
