import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure RigidBodyDynamicsPackage where
  massInertiaTensor : Prop
  angularMomentumConservation : Prop
  linearMomentumConservation : Prop
  forceTorqueBalance : Prop
  frictionModelApplied : Prop

structure RigidBodyDynamicsEvidence (D : RigidBodyDynamicsPackage) where
  massInertiaTensorClosed : D.massInertiaTensor
  angularMomentumConservationClosed : D.angularMomentumConservation
  linearMomentumConservationClosed : D.linearMomentumConservation
  forceTorqueBalanceClosed : D.forceTorqueBalance
  frictionModelAppliedClosed : D.frictionModelApplied

def RigidBodyDynamicsClosed (D : RigidBodyDynamicsPackage) : Prop :=
  D.massInertiaTensor ∧ D.angularMomentumConservation ∧
  D.linearMomentumConservation ∧ D.forceTorqueBalance ∧
  D.frictionModelApplied

theorem rigid_body_dynamics_closed_from_evidence
    (D : RigidBodyDynamicsPackage) (E : RigidBodyDynamicsEvidence D) :
    RigidBodyDynamicsClosed D := by
  exact And.intro E.massInertiaTensorClosed
    (And.intro E.angularMomentumConservationClosed
      (And.intro E.linearMomentumConservationClosed
        (And.intro E.forceTorqueBalanceClosed E.frictionModelAppliedClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse