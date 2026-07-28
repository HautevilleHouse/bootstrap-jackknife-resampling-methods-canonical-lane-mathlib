import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure JackknifeMethodPackage where
  sampleSize : ℕ
  pseudoValuesComputed : Prop
  jackknifeBiasEstimate : Prop
  jackknifeVarianceEstimate : Prop
  deleteOneScheme : Prop

structure JackknifeMethodEvidence (J : JackknifeMethodPackage) where
  pseudoValuesClosed : J.pseudoValuesComputed
  biasEstimateClosed : J.jackknifeBiasEstimate
  varianceEstimateClosed : J.jackknifeVarianceEstimate
  deleteOneClosed : J.deleteOneScheme

def JackknifeMethodClosed (J : JackknifeMethodPackage) : Prop :=
  J.pseudoValuesComputed ∧ J.jackknifeBiasEstimate ∧ J.jackknifeVarianceEstimate ∧ J.deleteOneScheme

theorem jackknife_method_closed_from_evidence (J : JackknifeMethodPackage) (E : JackknifeMethodEvidence J) : JackknifeMethodClosed J :=
  by
    exact And.intro E.pseudoValuesClosed (And.intro E.biasEstimateClosed (And.intro E.varianceEstimateClosed E.deleteOneClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse