import HautevilleHouse.BootstrapJackknifeResamplingMethodsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure Sample where
  size : Nat
  data : List Float

structure ResamplingMethod (T : Sample) where
  resampleCount : Nat
  resampleSize : Nat

structure BootstrapMethod (T : Sample) extends ResamplingMethod T where
  replicateCount : Nat

structure JackknifeMethod (T : Sample) extends ResamplingMethod T where
  leaveOneOut : Bool

structure BootstrapEstimate (T : Sample) (B : BootstrapMethod T) where
  estimator : String
  value : Float
  variance : Float
  consistent : Prop

structure JackknifeEstimate (T : Sample) (J : JackknifeMethod T) where
  estimator : String
  value : Float
  pseudovalues : List Float
  varianceEstimate : Float
  consistent : Prop

structure BootstrapConsistencyEvidence (T : Sample) (B : BootstrapMethod T) (E : BootstrapEstimate T B) where
  consistentClosed : E.consistent

def BootstrapConsistency (T : Sample) (B : BootstrapMethod T) (E : BootstrapEstimate T B) : Prop :=
  E.consistent

theorem bootstrap_consistency_from_evidence
    {T : Sample} {B : BootstrapMethod T} {E : BootstrapEstimate T B}
    (evidence : BootstrapConsistencyEvidence T B E) : BootstrapConsistency T B E := by
  exact evidence.consistentClosed

structure JackknifeConsistencyEvidence (T : Sample) (J : JackknifeMethod T) (E : JackknifeEstimate T J) where
  consistentClosed : E.consistent

def JackknifeConsistency (T : Sample) (J : JackknifeMethod T) (E : JackknifeEstimate T J) : Prop :=
  E.consistent

theorem jackknife_consistency_from_evidence
    {T : Sample} {J : JackknifeMethod T} {E : JackknifeEstimate T J}
    (evidence : JackknifeConsistencyEvidence T J E) : JackknifeConsistency T J E := by
  exact evidence.consistentClosed

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse