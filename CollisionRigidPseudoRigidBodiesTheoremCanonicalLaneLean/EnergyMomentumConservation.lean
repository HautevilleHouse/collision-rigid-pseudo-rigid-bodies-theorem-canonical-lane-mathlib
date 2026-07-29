import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure EnergyMomentumConservationPackage where
  initialKineticEnergy : ℝ
  finalKineticEnergy : ℝ
  initialMomentum : Vector ℝ 3
  finalMomentum : Vector ℝ 3
  energyConservation : Prop
  momentumConservation : Prop
  energyLossModel : Prop

structure EnergyMomentumConservationEvidence (E : EnergyMomentumConservationPackage) where
  energyConservationClosed : E.energyConservation
  momentumConservationClosed : E.momentumConservation
  energyLossModelClosed : E.energyLossModel

def EnergyMomentumConservationClosed (E : EnergyMomentumConservationPackage) : Prop :=
  E.energyConservation ∧ E.momentumConservation ∧ E.energyLossModel

theorem energy_momentum_conservation_closed_from_evidence
    (E : EnergyMomentumConservationPackage) (Ev : EnergyMomentumConservationEvidence E) :
    EnergyMomentumConservationClosed E := by
  exact And.intro Ev.energyConservationClosed (And.intro Ev.momentumConservationClosed Ev.energyLossModelClosed)

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse