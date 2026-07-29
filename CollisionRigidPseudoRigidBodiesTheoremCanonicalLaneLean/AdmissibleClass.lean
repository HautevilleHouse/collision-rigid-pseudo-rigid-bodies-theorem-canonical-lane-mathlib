import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : CollisionRigidPseudoRigidBodyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CollisionRigidPseudoRigidBodyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse