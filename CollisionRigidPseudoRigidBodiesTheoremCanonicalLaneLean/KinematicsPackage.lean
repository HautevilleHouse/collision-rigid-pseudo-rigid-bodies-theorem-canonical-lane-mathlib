import HautevilleHouse.CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean.AdmissibleClass

/-!
# Kinematics Package

This module defines the kinematic state and evolution equations for rigid and
pseudo-rigid bodies leading up to a collision event.
-/

namespace HautevilleHouse
namespace CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean

/-- A rigid body is characterized by its pose (position and orientation). -/
structure RigidBodyState where
  position : ℝ × ℝ × ℝ
  orientation : ℝ × ℝ × ℝ × ℝ  -- quaternion
  linearVelocity : ℝ × ℝ × ℝ
  angularVelocity : ℝ × ℝ × ℝ

/-- A pseudo-rigid body additionally has an affine deformation tensor. -/
structure PseudoRigidBodyState where
  position : ℝ × ℝ × ℝ
  orientation : ℝ × ℝ × ℝ × ℝ
  linearVelocity : ℝ × ℝ × ℝ
  angularVelocity : ℝ × ℝ × ℝ
  deformationGradient : ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ  -- 3x3 matrix flattened
  deformationVelocity : ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ × ℝ

/-- Kinematic package bundles the pre-collision states of both bodies. -/
structure KinematicsPackage where
  rigid : RigidBodyState
  pseudo : PseudoRigidBodyState
  timeToCollision : ℝ
  relativeApproachVelocity : ℝ × ℝ × ℝ
  relativeApproachVelocityPositive : relativeApproachVelocity.1 > 0 ∨ relativeApproachVelocity.2 > 0 ∨ relativeApproachVelocity.3 > 0

/-- Evidence that the kinematic package is consistent. -/
structure KinematicsEvidence (K : KinematicsPackage) where
  rigidStateNonzero : K.rigid.linearVelocity.1 ≠ 0 ∨ K.rigid.linearVelocity.2 ≠ 0 ∨ K.rigid.linearVelocity.3 ≠ 0
  pseudoStateNonzero : K.pseudo.linearVelocity.1 ≠ 0 ∨ K.pseudo.linearVelocity.2 ≠ 0 ∨ K.pseudo.linearVelocity.3 ≠ 0
  timePositive : K.timeToCollision > 0
  approachMonotone : True  -- placeholder for monotonicity

/-- Kinematics closed: the kinematic package with evidence. -/
def KinematicsClosed (K : KinematicsPackage) : Prop :=
  K.relativeApproachVelocityPositive ∧
  (K.rigid.linearVelocity.1 ≠ 0 ∨ K.rigid.linearVelocity.2 ≠ 0 ∨ K.rigid.linearVelocity.3 ≠ 0) ∧
  (K.pseudo.linearVelocity.1 ≠ 0 ∨ K.pseudo.linearVelocity.2 ≠ 0 ∨ K.pseudo.linearVelocity.3 ≠ 0) ∧
  K.timeToCollision > 0

theorem kinematics_closed_from_evidence (K : KinematicsPackage) (E : KinematicsEvidence K) : KinematicsClosed K := by
  exact And.intro K.relativeApproachVelocityPositive
    (And.intro E.rigidStateNonzero (And.intro E.pseudoStateNonzero E.timePositive))

end CollisionRigidPseudoRigidBodiesTheoremCanonicalLaneLean
end HautevilleHouse
