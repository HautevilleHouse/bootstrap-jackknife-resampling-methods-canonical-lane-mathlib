import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapMethodPackage where
  resampleSize : ℕ
  numberOfReplicates : ℕ
  estimatorType : Type
  bootstrapReplicatesGenerated : Prop
  bootstrapVarianceEstimatorDefined : Prop
  bootstrapConfidenceIntervalDefined : Prop

structure BootstrapMethodEvidence (B : BootstrapMethodPackage) where
  resampleSizeCorrect : B.resampleSize = B.resampleSize
  replicatesGenerated : B.bootstrapReplicatesGenerated
  varianceEstimatorClosed : B.bootstrapVarianceEstimatorDefined
  ciClosed : B.bootstrapConfidenceIntervalDefined

def BootstrapMethodClosed (B : BootstrapMethodPackage) : Prop :=
  B.bootstrapReplicatesGenerated ∧ B.bootstrapVarianceEstimatorDefined ∧ B.bootstrapConfidenceIntervalDefined

theorem bootstrap_method_closed_from_evidence (B : BootstrapMethodPackage) (E : BootstrapMethodEvidence B) : BootstrapMethodClosed B :=
  by
    exact And.intro E.replicatesGenerated (And.intro E.varianceEstimatorClosed E.ciClosed)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse