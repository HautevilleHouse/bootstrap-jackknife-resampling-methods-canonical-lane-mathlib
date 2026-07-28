import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapDistributionPackage where
  sampleSize : Nat
  replications : Nat
  statisticType : Type u
  observedStatistic : statisticType
  bootstrapReplicates : List statisticType
  distributionApproximation : Prop
  distributionApproximationTerm : distributionApproximation

structure BootstrapDistributionEvidence (P : BootstrapDistributionPackage) where
  sampleSizeClosed : P.sampleSize > 0
  replicationsClosed : P.replications ≥ 1000
  distributionApproximationClosed : P.distributionApproximation

def BootstrapDistributionClosed (P : BootstrapDistributionPackage) : Prop :=
  P.sampleSize > 0 ∧ P.replications ≥ 1000 ∧ P.distributionApproximation

theorem bootstrap_distribution_closed_from_evidence (P : BootstrapDistributionPackage)
    (E : BootstrapDistributionEvidence P) : BootstrapDistributionClosed P := by
  exact And.intro E.sampleSizeClosed (And.intro E.replicationsClosed E.distributionApproximationClosed)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse