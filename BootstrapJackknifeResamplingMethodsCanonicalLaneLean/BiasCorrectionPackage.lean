import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BiasCorrectionPackage (B : BootstrapResamplePackage) (J : JackknifeInfluencePackage) where
  bootstrapBias : Prop
  jackknifeBias : Prop
  biasCorrectionMethod : Prop
  correctedEstimator : Prop

structure BiasCorrectionEvidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (C : BiasCorrectionPackage B J) where
  bootstrapBiasClosed : C.bootstrapBias
  jackknifeBiasClosed : C.jackknifeBias
  biasCorrectionMethodClosed : C.biasCorrectionMethod
  correctedEstimatorClosed : C.correctedEstimator

def BiasCorrectionClosed {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (C : BiasCorrectionPackage B J) : Prop :=
  C.bootstrapBias ∧ C.jackknifeBias ∧ C.biasCorrectionMethod ∧ C.correctedEstimator

theorem bias_correction_closed_from_evidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (C : BiasCorrectionPackage B J) (E : BiasCorrectionEvidence C) :
    BiasCorrectionClosed C := by
  exact And.intro E.bootstrapBiasClosed (And.intro E.jackknifeBiasClosed (And.intro E.biasCorrectionMethodClosed E.correctedEstimatorClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse