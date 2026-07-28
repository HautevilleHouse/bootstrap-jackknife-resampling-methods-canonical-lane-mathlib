import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure JackknifeInfluencePackage where
  sampleSpace : Type u
  jackknifeResample : sampleSpace → Prop
  influenceFunction : Prop
  leaveOneOutEstimate : Prop
  jackknifeStatistic : Prop

structure JackknifeInfluenceEvidence (J : JackknifeInfluencePackage) where
  jackknifeResampleClosed : J.jackknifeResample
  influenceFunctionClosed : J.influenceFunction
  leaveOneOutEstimateClosed : J.leaveOneOutEstimate
  jackknifeStatisticClosed : J.jackknifeStatistic

def JackknifeInfluenceClosed (J : JackknifeInfluencePackage) : Prop :=
  J.jackknifeResample ∧ J.influenceFunction ∧ J.leaveOneOutEstimate ∧ J.jackknifeStatistic

theorem jackknife_influence_closed_from_evidence (J : JackknifeInfluencePackage) (E : JackknifeInfluenceEvidence J) :
    JackknifeInfluenceClosed J := by
  exact And.intro E.jackknifeResampleClosed (And.intro E.influenceFunctionClosed (And.intro E.leaveOneOutEstimateClosed E.jackknifeStatisticClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse