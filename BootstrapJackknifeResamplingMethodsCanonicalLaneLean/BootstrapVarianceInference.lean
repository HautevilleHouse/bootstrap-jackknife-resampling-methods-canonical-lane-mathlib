import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapVarianceInferencePackage where
  bootstrapVarianceType : String
  standardErrorComputed : Prop
  percentileIntervalDefined : Prop
  BCaIntervalDefined : Prop
  bootstrapHypothesisTestDefined : Prop

structure BootstrapVarianceInferenceEvidence (V : BootstrapVarianceInferencePackage) where
  standardErrorClosed : V.standardErrorComputed
  percentileIntervalClosed : V.percentileIntervalDefined
  bcaIntervalClosed : V.BCaIntervalDefined
  hypothesisTestClosed : V.bootstrapHypothesisTestDefined

def BootstrapVarianceInferenceClosed (V : BootstrapVarianceInferencePackage) : Prop :=
  V.standardErrorComputed ∧ V.percentileIntervalDefined ∧ V.BCaIntervalDefined ∧ V.bootstrapHypothesisTestDefined

theorem bootstrap_variance_inference_closed_from_evidence (V : BootstrapVarianceInferencePackage) (E : BootstrapVarianceInferenceEvidence V) : BootstrapVarianceInferenceClosed V :=
  by
    exact And.intro E.standardErrorClosed (And.intro E.percentileIntervalClosed (And.intro E.bcaIntervalClosed E.hypothesisTestClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse