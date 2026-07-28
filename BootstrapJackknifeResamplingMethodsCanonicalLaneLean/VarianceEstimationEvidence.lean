import HautevilleHouse.BootstrapJackknifeResamplingMethodsCanonicalLaneLean.ConsistencyResults

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapVarianceEstimation where
  varianceEstimator : String
  varianceValue : Float
  standardError : Float
  confidenceInterval : (Float × Float)

def BootstrapVarianceEstimationClosed (V : BootstrapVarianceEstimation) : Prop :=
  V.varianceValue > 0 ∧ V.standardError > 0

structure BootstrapVarianceEstimationEvidence (V : BootstrapVarianceEstimation) where
  variancePositive : V.varianceValue > 0
  standardErrorPositive : V.standardError > 0

theorem bootstrap_variance_estimation_closed_from_evidence
    (V : BootstrapVarianceEstimation) (E : BootstrapVarianceEstimationEvidence V) :
    BootstrapVarianceEstimationClosed V := by
  exact And.intro E.variancePositive E.standardErrorPositive

structure JackknifeVarianceEstimation where
  pseudovariance : Float
  standardError : Float
  confidenceInterval : (Float × Float)

def JackknifeVarianceEstimationClosed (V : JackknifeVarianceEstimation) : Prop :=
  V.pseudovariance > 0 ∧ V.standardError > 0

structure JackknifeVarianceEstimationEvidence (V : JackknifeVarianceEstimation) where
  pseudovariancePositive : V.pseudovariance > 0
  standardErrorPositive : V.standardError > 0

theorem jackknife_variance_estimation_closed_from_evidence
    (V : JackknifeVarianceEstimation) (E : JackknifeVarianceEstimationEvidence V) :
    JackknifeVarianceEstimationClosed V := by
  exact And.intro E.pseudovariancePositive E.standardErrorPositive

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse