import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapHypothesisTestingPackage where
  nullStatistic : ℝ
  bootstrapDistribution : List ℝ
  pValue : ℝ
  rejectNull : Bool
  significanceLevel : ℝ

structure BootstrapHypothesisTestingEvidence (pkg : BootstrapHypothesisTestingPackage) where
  pValueComputed : pkg.pValue = (pkg.bootstrapDistribution.filter (λ x => x ≥ pkg.nullStatistic)).length.toFloat / pkg.bootstrapDistribution.length.toFloat
  significanceLevelValid : 0 < pkg.significanceLevel ∧ pkg.significanceLevel < 1
  rejectionCondition : pkg.rejectNull = (pkg.pValue < pkg.significanceLevel)

def BootstrapHypothesisTestingClosed (pkg : BootstrapHypothesisTestingPackage) : Prop :=
  pkg.pValue = (pkg.bootstrapDistribution.filter (λ x => x ≥ pkg.nullStatistic)).length.toFloat / pkg.bootstrapDistribution.length.toFloat ∧
  (0 < pkg.significanceLevel ∧ pkg.significanceLevel < 1) ∧
  pkg.rejectNull = (pkg.pValue < pkg.significanceLevel)

theorem bootstrap_hypothesis_testing_closed_from_evidence (pkg : BootstrapHypothesisTestingPackage) (E : BootstrapHypothesisTestingEvidence pkg) :
    BootstrapHypothesisTestingClosed pkg := by
  exact And.intro E.pValueComputed (And.intro E.significanceLevelValid E.rejectionCondition)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse