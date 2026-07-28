import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrappedConfidenceIntervalsPackage where
  method : String
  coverageProbability : ℝ
  intervalLength : ℝ
  coverageMet : Prop
  lengthFinite : Prop

default BootstrappedConfidenceIntervalsPackage

structure BootstrappedConfidenceIntervalsEvidence (C : BootstrappedConfidenceIntervalsPackage) where
  coverageMetClosed : C.coverageMet
  lengthFiniteClosed : C.lengthFinite

def BootstrappedConfidenceIntervalsClosed (C : BootstrappedConfidenceIntervalsPackage) : Prop :=
  C.coverageMet ∧ C.lengthFinite

theorem bootstrapped_confidence_intervals_closed_from_evidence
    (C : BootstrappedConfidenceIntervalsPackage)
    (E : BootstrappedConfidenceIntervalsEvidence C) : BootstrappedConfidenceIntervalsClosed C := by
  exact And.intro E.coverageMetClosed E.lengthFiniteClosed

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse