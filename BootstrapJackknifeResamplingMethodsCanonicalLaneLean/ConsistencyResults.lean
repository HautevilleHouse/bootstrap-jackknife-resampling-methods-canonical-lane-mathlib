import HautevilleHouse.BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BootstrapJackknifeObjects

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapAsymptoticNormality where
  convergesInDistribution : Prop
  varianceCorrect : Prop

def BootstrapAsymptoticNormalityClosed (B : BootstrapAsymptoticNormality) : Prop :=
  B.convergesInDistribution ∧ B.varianceCorrect

structure BootstrapAsymptoticNormalityEvidence (B : BootstrapAsymptoticNormality) where
  convergesInDistributionClosed : B.convergesInDistribution
  varianceCorrectClosed : B.varianceCorrect

theorem bootstrap_asymptotic_normality_closed_from_evidence
    (B : BootstrapAsymptoticNormality) (E : BootstrapAsymptoticNormalityEvidence B) :
    BootstrapAsymptoticNormalityClosed B := by
  exact And.intro E.convergesInDistributionClosed E.varianceCorrectClosed

structure JackknifeUnbiasedness where
  biasCorrected : Prop
  varianceEstimateUnbiased : Prop

def JackknifeUnbiasednessClosed (J : JackknifeUnbiasedness) : Prop :=
  J.biasCorrected ∧ J.varianceEstimateUnbiased

structure JackknifeUnbiasednessEvidence (J : JackknifeUnbiasedness) where
  biasCorrectedClosed : J.biasCorrected
  varianceEstimateUnbiasedClosed : J.varianceEstimateUnbiased

theorem jackknife_unbiasedness_closed_from_evidence
    (J : JackknifeUnbiasedness) (E : JackknifeUnbiasednessEvidence J) :
    JackknifeUnbiasednessClosed J := by
  exact And.intro E.biasCorrectedClosed E.varianceEstimateUnbiasedClosed

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse