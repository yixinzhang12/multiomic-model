data {
  int<lower=0> N; //observations
  int<lower=0> RNA[N]; // RNAseq
  real<lower=0,upper=1> ATAC[N]; // ATACseq
}

parameters {
  // Parameters for NB
  real<lower=0> mu_nb; // mean
  real<lower=0> phi_nb; //dispersion
  
  // Parameters for ZI beta
  real<lower=0,upper=1> alpha; //probabilty of non zero 
  real<lower=0,upper=1> mu_zb; //mean
  real<lower=0> phi_zb; //dispersion
}

model {
  // Priors
  mu_nb ~ normal(0, 5);
  phi_nb ~ normal(0, 5);
  alpha ~ beta(1, 1);
  mu_zb ~ beta(1, 1);
  phi_zb ~ gamma(0.1, 0.1);
  }
}
