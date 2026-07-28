import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure ResamplingAsymptoticsPackage where
  bootstrapConsistency : Prop
  jackknifeConsistency : Prop
  asymptoticNormality : Prop
  higherOrderCorrectness : Prop

structure ResamplingAsymptoticsEvidence (A : ResamplingAsymptoticsPackage) where
  bootstrapConsistencyClosed : A.bootstrapConsistency
  jackknifeConsistencyClosed : A.jackknifeConsistency
  asymptoticNormalityClosed : A.asymptoticNormality
  higherOrderCorrectnessClosed : A.higherOrderCorrectness

def ResamplingAsymptoticsClosed (A : ResamplingAsymptoticsPackage) : Prop :=
  A.bootstrapConsistency ∧ A.jackknifeConsistency ∧ A.asymptoticNormality ∧ A.higherOrderCorrectness

theorem resampling_asymptotics_closed_from_evidence (A : ResamplingAsymptoticsPackage) (E : ResamplingAsymptoticsEvidence A) : ResamplingAsymptoticsClosed A :=
  by
    exact And.intro E.bootstrapConsistencyClosed (And.intro E.jackknifeConsistencyClosed (And.intro E.asymptoticNormalityClosed E.higherOrderCorrectnessClosed))

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse