import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapHypothesisTestPackage where
  nullDistributionComputed : Prop
  pValueComputed : Prop
  testRejectionRule : Prop
  powerAnalysisPerformed : Prop

structure BootstrapHypothesisTestEvidence (H : BootstrapHypothesisTestPackage) where
  nullDistributionClosed : H.nullDistributionComputed
  pValueClosed : H.pValueComputed
  rejectionRuleClosed : H.testRejectionRule
  powerAnalysisClosed : H.powerAnalysisPerformed

def BootstrapHypothesisTestClosed (H : BootstrapHypothesisTestPackage) : Prop :=
  H.nullDistributionComputed ∧ H.pValueComputed ∧ H.testRejectionRule ∧ H.powerAnalysisPerformed

theorem bootstrap_hypothesis_test_closed_from_evidence (H : BootstrapHypothesisTestPackage) (E : BootstrapHypothesisTestEvidence H) : BootstrapHypothesisTestClosed H :=
  by
    exact And.intro E.nullDistributionClosed (And.intro E.pValueClosed (And.intro E.rejectionRuleClosed E.powerAnalysisClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse