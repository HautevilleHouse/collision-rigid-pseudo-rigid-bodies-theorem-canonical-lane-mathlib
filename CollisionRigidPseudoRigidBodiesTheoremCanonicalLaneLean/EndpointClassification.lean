import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.Geometrization

/-!
# Endpoint Classification Package
-/

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure EndpointClassificationPackage (C : CollisionRigidPseudoRigidBodiesPackage) where
  finalVelocityDistribution : Prop
  postImpactConfiguration : Prop
  endpointMatchesCollisionStatement : Prop

structure EndpointClassificationEvidence (C : CollisionRigidPseudoRigidBodiesPackage) (E : EndpointClassificationPackage C) where
  finalVelocityDistributionClosed : E.finalVelocityDistribution
  postImpactConfigurationClosed : E.postImpactConfiguration
  endpointMatchesCollisionStatementClosed : E.endpointMatchesCollisionStatement

def EndpointClassificationClosed (C : CollisionRigidPseudoRigidBodiesPackage) (E : EndpointClassificationPackage C) : Prop :=
  E.finalVelocityDistribution ∧ E.postImpactConfiguration ∧ E.endpointMatchesCollisionStatement

theorem endpoint_classification_closed_from_evidence
    (C : CollisionRigidPseudoRigidBodiesPackage) (E : EndpointClassificationPackage C) (Ev : EndpointClassificationEvidence C E) :
    EndpointClassificationClosed C E := by
  exact And.intro Ev.finalVelocityDistributionClosed
    (And.intro Ev.postImpactConfigurationClosed Ev.endpointMatchesCollisionStatementClosed)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse