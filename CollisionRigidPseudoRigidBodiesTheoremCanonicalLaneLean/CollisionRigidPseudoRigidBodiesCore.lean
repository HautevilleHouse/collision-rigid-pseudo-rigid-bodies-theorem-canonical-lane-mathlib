import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Collision Rigid Pseudo-Rigid Bodies Core Package
-/

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

structure CollisionRigidPseudoRigidBodiesPackage where
  bodyCount : ℕ
  collisionTimes : List ℝ
  momentumConservation : Prop
  energyConservation : Prop
  impactLaw : Prop
  pseudoRigidDeformation : Prop

structure CollisionRigidPseudoRigidBodiesEvidence (P : CollisionRigidPseudoRigidBodiesPackage) where
  collisionTimesClosed : P.collisionTimes ≠ []
  momentumConservationClosed : P.momentumConservation
  energyConservationClosed : P.energyConservation
  impactLawClosed : P.impactLaw
  pseudoRigidDeformationClosed : P.pseudoRigidDeformation

def CollisionRigidPseudoRigidBodiesClosed (P : CollisionRigidPseudoRigidBodiesPackage) : Prop :=
  P.collisionTimes ≠ [] ∧ P.momentumConservation ∧ P.energyConservation ∧ P.impactLaw ∧ P.pseudoRigidDeformation

theorem collision_rigid_pseudo_rigid_bodies_closed_from_evidence
    (P : CollisionRigidPseudoRigidBodiesPackage) (E : CollisionRigidPseudoRigidBodiesEvidence P) :
    CollisionRigidPseudoRigidBodiesClosed P := by
  exact And.intro E.collisionTimesClosed
    (And.intro E.momentumConservationClosed
      (And.intro E.energyConservationClosed
        (And.intro E.impactLawClosed E.pseudoRigidDeformationClosed)))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse