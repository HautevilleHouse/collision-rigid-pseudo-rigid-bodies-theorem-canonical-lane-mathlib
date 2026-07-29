import CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CollisionRigidPseudoRigidBodiesSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CollisionRigidPseudoRigidBodiesAdmittedObject where
  space : CollisionRigidPseudoRigidBodiesSpace
  numberOfBodies : ℕ
  collisionExists : Prop
  pseudoRigidModel : Prop
  conclusion : collisionExists ∧ pseudoRigidModel

structure CollisionRigidPseudoRigidBodiesEndgameState where
  object : CollisionRigidPseudoRigidBodiesAdmittedObject

def CollisionRigidPseudoRigidBodiesWitnessClosed (O : CollisionRigidPseudoRigidBodiesAdmittedObject) : Prop :=
  O.collisionExists ∧ O.pseudoRigidModel

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse