import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure ImpactResponseAnalysisPackage where
  collisionTimeline : Type u
  impactForceHistory : Prop
  momentumChange : Prop
  energyDissipation : Prop
  deformationRecovery : Prop
  finalVelocityField : Prop
  postImpactStability : Prop

structure ImpactResponseAnalysisEvidence (R : ImpactResponseAnalysisPackage) where
  impactForceHistoryClosed : R.impactForceHistory
  momentumChangeClosed : R.momentumChange
  energyDissipationClosed : R.energyDissipation
  deformationRecoveryClosed : R.deformationRecovery
  finalVelocityFieldClosed : R.finalVelocityField
  postImpactStabilityClosed : R.postImpactStability

def ImpactResponseAnalysisClosed (R : ImpactResponseAnalysisPackage) : Prop :=
  R.impactForceHistory ∧ R.momentumChange ∧ R.energyDissipation ∧
  R.deformationRecovery ∧ R.finalVelocityField ∧ R.postImpactStability

theorem impact_response_analysis_closed_from_evidence
    (R : ImpactResponseAnalysisPackage) (E : ImpactResponseAnalysisEvidence R) :
    ImpactResponseAnalysisClosed R := by
  exact And.intro E.impactForceHistoryClosed
    (And.intro E.momentumChangeClosed
      (And.intro E.energyDissipationClosed
        (And.intro E.deformationRecoveryClosed
          (And.intro E.finalVelocityFieldClosed E.postImpactStabilityClosed))))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
