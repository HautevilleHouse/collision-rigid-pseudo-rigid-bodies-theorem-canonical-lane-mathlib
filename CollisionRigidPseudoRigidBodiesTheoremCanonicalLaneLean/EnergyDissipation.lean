import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.ImpactLaws

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure EnergyDissipationPackage where
  impactLaws : ImpactLawsPackage
  dissipationMechanism : Prop
  thermalEffects : Prop
  plasticDeformationEnergy : Prop
  dissipationRate : Prop
  energyConservationError : Prop

structure EnergyDissipationEvidence (pkg : EnergyDissipationPackage) where
  dissipationMechanismClosed : pkg.dissipationMechanism
  thermalEffectsClosed : pkg.thermalEffects
  plasticDeformationEnergyClosed : pkg.plasticDeformationEnergy
  dissipationRateClosed : pkg.dissipationRate
  energyConservationErrorClosed : pkg.energyConservationError

def EnergyDissipationClosed (pkg : EnergyDissipationPackage) : Prop :=
  pkg.dissipationMechanism ∧ pkg.thermalEffects ∧
  pkg.plasticDeformationEnergy ∧ pkg.dissipationRate ∧ pkg.energyConservationError

theorem energy_dissipation_closed_from_evidence (pkg : EnergyDissipationPackage)
    (E : EnergyDissipationEvidence pkg) : EnergyDissipationClosed pkg := by
  exact And.intro E.dissipationMechanismClosed
    (And.intro E.thermalEffectsClosed
      (And.intro E.plasticDeformationEnergyClosed
        (And.intro E.dissipationRateClosed E.energyConservationErrorClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse