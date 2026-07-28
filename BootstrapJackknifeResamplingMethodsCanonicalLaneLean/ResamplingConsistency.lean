import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure ResamplingConsistencyPackage where
  estimator : (List ℝ) → ℝ
  bootstrapVariance : ℝ
  jackknifeVariance : ℝ
  asymptoticConsistency : Prop
  finiteSampleConsistency : Prop

default ResamplingConsistencyPackage

structure ResamplingConsistencyEvidence (R : ResamplingConsistencyPackage) where
  asymptoticConsistencyClosed : R.asymptoticConsistency
  finiteSampleConsistencyClosed : R.finiteSampleConsistency

def ResamplingConsistencyClosed (R : ResamplingConsistencyPackage) : Prop :=
  R.asymptoticConsistency ∧ R.finiteSampleConsistency

theorem resampling_consistency_closed_from_evidence (R : ResamplingConsistencyPackage)
    (E : ResamplingConsistencyEvidence R) : ResamplingConsistencyClosed R := by
  exact And.intro E.asymptoticConsistencyClosed E.finiteSampleConsistencyClosed

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse