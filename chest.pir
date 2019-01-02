#!/usr/bin/parrot -w


.sub zilch
  noop
.end


.sub tune
  .param int nu
  .param string qp
  .local string head, tail, druk
  substr head, qp, nu
  substr tail, qp,  0, nu
  concat druk, head, tail
  .return(druk)
.end


.sub peg_Bj
  .param string qp
  $S0 = tune(50, qp)
  .return($S0)
.end


.sub peg_Fn
  .param string qp
  $S0 = tune(25, qp)
  .return($S0)
.end


.sub peg_Cn
  .param string qp
  $S0 = tune( 0, qp)
  .return($S0)
.end


.sub peg_Gn
  .param string qp
  $S0 = tune(35, qp)
  .return($S0)
.end


.sub peg_Dn
  .param string qp
  $S0 = tune(10, qp)
  .return($S0)
.end


.sub peg_An
  .param string qp
  $S0 = tune(45, qp)
  .return($S0)
.end


.sub peg_En
  .param string qp
  $S0 = tune(20, qp)
  .return($S0)
.end


.sub peg_Bn
  .param string qp
  $S0 = tune(55, qp)
  .return($S0)
.end


.sub peg_Fk
  .param string qp
  $S0 = tune(30, qp)
  .return($S0)
.end


.sub cgdae
  .param string qp

  $S0 = peg_En(qp)
  $S1 = peg_An(qp)
  $S2 = peg_Dn(qp)
  $S3 = peg_Gn(qp)
  $S4 = peg_Cn(qp)

  new  $P0, 'ResizablePMCArray'
  push $P0, $S0
  push $P0, $S1
  push $P0, $S2
  push $P0, $S3
  push $P0, $S4

  .return($P0)

.end


.sub eadgbe
  .param string qp

  $S0 = peg_En(qp)
  $S1 = peg_Bn(qp)
  $S2 = peg_Gn(qp)
  $S3 = peg_Dn(qp)
  $S4 = peg_An(qp)

  new  $P0, 'ResizablePMCArray'
  push $P0, $S0
  push $P0, $S1
  push $P0, $S2
  push $P0, $S3
  push $P0, $S4
  push $P0, $S0

  .return($P0)

.end


.sub ennead
  .param string qp

  $S0 = peg_Bj(qp)
  $S1 = peg_Fn(qp)
  $S2 = peg_Cn(qp)
  $S3 = peg_Gn(qp)
  $S4 = peg_Dn(qp)
  $S5 = peg_An(qp)
  $S6 = peg_En(qp)
  $S7 = peg_Bn(qp)
  $S8 = peg_Fk(qp)

  new  $P0, 'ResizablePMCArray'
  push $P0, $S0
  push $P0, $S1
  push $P0, $S2
  push $P0, $S3
  push $P0, $S4
  push $P0, $S5
  push $P0, $S6
  push $P0, $S7
  push $P0, $S8

  .return($P0)

.end


.sub fabricate
  .param string signat
  .param string tuning
  .param string epoch
  .param string course

  new $P0, 'ResizablePMCArray'
  $P1 = get_global tuning
  defined $I0, $P1
  unless $I0, TERM
  $P0 = $P1(course)

  $S0  = signat . '-'
  $S0 .= tuning
  $S0 .= '-m'
  $S0 .= epoch
  unshift $P0, $S0

  elements $I1, $P0
  repeat $S1, "\n\t%s", $I1
  sprintf $S2, $S1, $P0
  .return($S2)

TERM:
  concat $S0, tuning, '?'
  die $S0

.end


