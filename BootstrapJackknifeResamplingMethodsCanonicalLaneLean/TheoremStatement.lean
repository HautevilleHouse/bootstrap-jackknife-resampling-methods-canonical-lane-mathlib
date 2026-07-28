namespace HautevilleHouse
namespace BootstrapJackknifeResamplingMethodsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  resamplingConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "bootstrap-jackknife-canonical-lane",
  theoremName := "Bootstrap Jackknife Resampling Methods",
  theoremObject := "Consistency of bootstrap variance estimator and jackknife bias correction",
  classicalBoundary := "unrestricted classical asymptotics",
  resamplingConstrainedStatement := "resampling-constrained theorem certificate internalized through bootstrap and jackknife consistency conditions",
  certificateLane := "resampling_constrained",
  carriedRemainder := "classical source boundary carried by formalizationCertificate"
}

end BootstrapJackknifeResamplingMethodsCanonicalLaneLean
end HautevilleHouse