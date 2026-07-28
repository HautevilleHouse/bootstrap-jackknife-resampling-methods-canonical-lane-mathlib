import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapConfidenceIntervalPackage where
  bootstrapDistribution : List Float
  confidenceLevel : Float
  method : String
  lowerBound : Float
  upperBound : Float
  intervalValid : Prop
  intervalValidTerm : intervalValid

structure BootstrapConfidenceIntervalEvidence (P : BootstrapConfidenceIntervalPackage) where
  distributionNonempty : P.bootstrapDistribution ≠ []
  levelInRange : 0.0 < P.confidenceLevel ∧ P.confidenceLevel < 1.0
  methodSupported : P.method ∈ ["percentile", "BCa", "basic"]
  intervalValidClosed : P.intervalValid

def BootstrapConfidenceIntervalClosed (P : BootstrapConfidenceIntervalPackage) : Prop :=
  P.bootstrapDistribution ≠ [] ∧ (0.0 < P.confidenceLevel ∧ P.confidenceLevel < 1.0) ∧
  P.method ∈ ["percentile", "BCa", "basic"] ∧ P.intervalValid

theorem bootstrap_confidence_interval_closed_from_evidence (P : BootstrapConfidenceIntervalPackage)
    (E : BootstrapConfidenceIntervalEvidence P) : BootstrapConfidenceIntervalClosed P := by
  exact And.intro E.distributionNonempty (And.intro E.levelInRange (And.intro E.methodSupported E.intervalValidClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse