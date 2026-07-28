import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure JackknifeBiasReductionPackage where
  sampleSize : Nat
  deleteOneSamples : List (List Float)
  deleteOneEstimates : List Float
  fullSampleEstimate : Float
  biasEstimate : Float
  biasCorrectionApplied : Prop
  biasCorrectionAppliedTerm : biasCorrectionApplied

structure JackknifeBiasReductionEvidence (P : JackknifeBiasReductionPackage) where
  sampleSizeClosed : P.sampleSize > 1
  computeClosed : P.deleteOneEstimates.length = P.sampleSize
  biasCorrectionAppliedClosed : P.biasCorrectionApplied

def JackknifeBiasReductionClosed (P : JackknifeBiasReductionPackage) : Prop :=
  P.sampleSize > 1 ∧ P.deleteOneEstimates.length = P.sampleSize ∧ P.biasCorrectionApplied

theorem jackknife_bias_reduction_closed_from_evidence (P : JackknifeBiasReductionPackage)
    (E : JackknifeBiasReductionEvidence P) : JackknifeBiasReductionClosed P := by
  exact And.intro E.sampleSizeClosed (And.intro E.computeClosed E.biasCorrectionAppliedClosed)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse