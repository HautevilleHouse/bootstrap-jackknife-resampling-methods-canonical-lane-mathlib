import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure JackknifeVariancePackage where
  sample : Type
  estimator : (List (sample × ℝ)) → ℝ
  jackknifeReplicates : List ((List (sample × ℝ)) → ℝ)
  varianceEstimate : ℝ
  unbiasedness : Prop

default JackknifeVariancePackage

structure JackknifeVarianceEvidence (J : JackknifeVariancePackage) where
  varianceEstimateClosed : J.varianceEstimate > 0
  unbiasednessClosed : J.unbiasedness

def JackknifeVarianceClosed (J : JackknifeVariancePackage) : Prop :=
  J.varianceEstimate > 0 ∧ J.unbiasedness

theorem jackknife_variance_closed_from_evidence (J : JackknifeVariancePackage)
    (E : JackknifeVarianceEvidence J) : JackknifeVarianceClosed J := by
  exact And.intro E.varianceEstimateClosed E.unbiasednessClosed

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse