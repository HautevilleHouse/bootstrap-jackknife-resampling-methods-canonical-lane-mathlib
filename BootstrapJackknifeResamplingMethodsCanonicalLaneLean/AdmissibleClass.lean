import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure BootstrapAdmittedObject where
  sample : Type
  statistic : BootstrapStatistic sample
  bootstrapDistribution : Prop
  jackknifeVariance : Prop
  consistency : Prop
  intervalCoverage : Prop
  conclusion : bootstrapDistribution ∧ jackknifeVariance ∧ consistency ∧ intervalCoverage

structure AdmissibleClass where
  object : BootstrapAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse