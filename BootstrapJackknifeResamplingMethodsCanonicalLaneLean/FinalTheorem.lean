import canonicalLaneMathlib.AdmissibleClass
import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BootstrapDistribution
import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.JackknifeBiasReduction
import BootstrapJackknifeResamplingMethodsCanonicalLaneLean.BootstrapConfidenceInterval

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

def ConstrainedBootstrapJackknifeClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bootstrap_jackknife_endgame (A : AdmissibleClass) :
    ConstrainedBootstrapJackknifeClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse