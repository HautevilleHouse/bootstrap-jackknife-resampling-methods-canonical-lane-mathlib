import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure ConfidenceIntervalPackage (B : BootstrapResamplePackage) (J : JackknifeInfluencePackage) (V : VarianceEstimationPackage B J) where
  bootstrapPercentileInterval : Prop
  jackknifeStudentizedInterval : Prop
  coverageProbability : Prop
  intervalEstimate : Prop

structure ConfidenceIntervalEvidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} {V : VarianceEstimationPackage B J} (I : ConfidenceIntervalPackage B J V) where
  bootstrapPercentileIntervalClosed : I.bootstrapPercentileInterval
  jackknifeStudentizedIntervalClosed : I.jackknifeStudentizedInterval
  coverageProbabilityClosed : I.coverageProbability
  intervalEstimateClosed : I.intervalEstimate

def ConfidenceIntervalClosed {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} {V : VarianceEstimationPackage B J} (I : ConfidenceIntervalPackage B J V) : Prop :=
  I.bootstrapPercentileInterval ∧ I.jackknifeStudentizedInterval ∧ I.coverageProbability ∧ I.intervalEstimate

theorem confidence_interval_closed_from_evidence {B : BootstrapResamplePackage} {J : JackknifeInfluencePackage} {V : VarianceEstimationPackage B J} (I : ConfidenceIntervalPackage B J V) (E : ConfidenceIntervalEvidence I) :
    ConfidenceIntervalClosed I := by
  exact And.intro E.bootstrapPercentileIntervalClosed (And.intro E.jackknifeStudentizedIntervalClosed (And.intro E.coverageProbabilityClosed E.intervalEstimateClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse