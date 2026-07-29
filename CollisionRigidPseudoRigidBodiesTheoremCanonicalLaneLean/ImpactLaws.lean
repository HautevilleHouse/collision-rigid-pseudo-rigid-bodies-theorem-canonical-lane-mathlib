import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.ContactModel

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ImpactLawsPackage where
  contactModel : ContactModelPackage
  restitutionCoefficient : Prop
  impulseMomentumRelation : Prop
  energyLossDuringImpact : Prop
  impactDuration : Prop
  postImpactVelocities : Prop

structure ImpactLawsEvidence (pkg : ImpactLawsPackage) where
  restitutionCoefficientClosed : pkg.restitutionCoefficient
  impulseMomentumRelationClosed : pkg.impulseMomentumRelation
  energyLossDuringImpactClosed : pkg.energyLossDuringImpact
  impactDurationClosed : pkg.impactDuration
  postImpactVelocitiesClosed : pkg.postImpactVelocities

def ImpactLawsClosed (pkg : ImpactLawsPackage) : Prop :=
  pkg.restitutionCoefficient ∧ pkg.impulseMomentumRelation ∧
  pkg.energyLossDuringImpact ∧ pkg.impactDuration ∧ pkg.postImpactVelocities

theorem impact_laws_closed_from_evidence (pkg : ImpactLawsPackage)
    (E : ImpactLawsEvidence pkg) : ImpactLawsClosed pkg := by
  exact And.intro E.restitutionCoefficientClosed
    (And.intro E.impulseMomentumRelationClosed
      (And.intro E.energyLossDuringImpactClosed
        (And.intro E.impactDurationClosed E.postImpactVelocitiesClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse