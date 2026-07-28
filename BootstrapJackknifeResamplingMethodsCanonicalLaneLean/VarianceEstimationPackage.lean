import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure VarianceEstimationPackage (B : BootstrapResamplePackage) (J : JackknifeInfluencePackage) where
  bootstrapVariance : Prop
  jackknifeVariance : Prop
  varianceConsistency : Prop
  standardErrorEstimate : Prop

structure VarianceEstimationEvidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (V : VarianceEstimationPackage B J) where
  bootstrapVarianceClosed : V.bootstrapVariance
  jackknifeVarianceClosed : V.jackknifeVariance
  varianceConsistencyClosed : V.varianceConsistency
  standardErrorEstimateClosed : V.standardErrorEstimate

def VarianceEstimationClosed {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (V : VarianceEstimationPackage B J) : Prop :=
  V.bootstrapVariance ∧ V.jackknifeVariance ∧ V.varianceConsistency ∧ V.standardErrorEstimate

theorem variance_estimation_closed_from_evidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} (V : VarianceEstimationPackage B J) (E : VarianceEstimationEvidence V) :
    VarianceEstimationClosed V := by
  exact And.intro E.bootstrapVarianceClosed (And.intro E.jackknifeVarianceClosed (And.intro E.varianceConsistencyClosed E.standardErrorEstimateClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse