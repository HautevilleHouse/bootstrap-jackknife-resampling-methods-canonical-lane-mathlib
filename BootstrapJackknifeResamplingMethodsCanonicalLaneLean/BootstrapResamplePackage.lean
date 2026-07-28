import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapResamplePackage where
  sampleSpace : Type u
  empiricalDistribution : sampleSpace → Prop
  bootstrapResample : sampleSpace → Prop
  resampleDistribution : Prop
  bootstrapStatistic : Prop
  nResamples : Nat

structure BootstrapResampleEvidence (B : BootstrapResamplePackage) where
  empiricalDistributionClosed : B.empiricalDistribution
  resampleDistributionClosed : B.resampleDistribution
  bootstrapStatisticClosed : B.bootstrapStatistic

def BootstrapResampleClosed (B : BootstrapResamplePackage) : Prop :=
  B.empiricalDistribution ∧ B.resampleDistribution ∧ B.bootstrapStatistic

theorem bootstrap_resample_closed_from_evidence (B : BootstrapResamplePackage) (E : BootstrapResampleEvidence B) :
    BootstrapResampleClosed B := by
  exact And.intro E.empiricalDistributionClosed (And.intro E.resampleDistributionClosed E.bootstrapStatisticClosed)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse