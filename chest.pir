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

  $S0 = '' # empty
  $S1 = peg_En(qp)
  $S2 = peg_An(qp)
  $S3 = peg_Dn(qp)
  $S4 = peg_Gn(qp)
  $S5 = peg_Cn(qp)

  new $P0, 'FixedStringArray', 6
  set $P0[0], $S0
  set $P0[1], $S1
  set $P0[2], $S2
  set $P0[3], $S3
  set $P0[4], $S4
  set $P0[5], $S5

  .return($P0)

.end


.sub eadgbe
  .param string qp

  $S0 = '' #empty
  $S1 = peg_En(qp)
  $S2 = peg_Bn(qp)
  $S3 = peg_Gn(qp)
  $S4 = peg_Dn(qp)
  $S5 = peg_An(qp)

  new $P0, 'FixedStringArray', 7
  set $P0[0], $S0
  set $P0[1], $S1
  set $P0[2], $S2
  set $P0[3], $S3
  set $P0[4], $S4
  set $P0[5], $S5
  set $P0[6], $S1

  .return($P0)

.end


.sub ennead
  .param string qp

  $S0 = '' # empty
  $S1 = peg_Bj(qp)
  $S2 = peg_Fn(qp)
  $S3 = peg_Cn(qp)
  $S4 = peg_Gn(qp)
  $S5 = peg_Dn(qp)
  $S6 = peg_An(qp)
  $S7 = peg_En(qp)
  $S8 = peg_Bn(qp)
  $S9 = peg_Fk(qp)

  new $P0, 'FixedStringArray', 10
  set $P0[0], $S0
  set $P0[1], $S1
  set $P0[2], $S2
  set $P0[3], $S3
  set $P0[4], $S4
  set $P0[5], $S5
  set $P0[6], $S6
  set $P0[7], $S7
  set $P0[8], $S8
  set $P0[9], $S9

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
  unless $I0, finish
  $P0 = $P1(course)

  $S0  = signat . '-'
  $S0 .= tuning
  $S0 .= '-m'
  $S0 .= epoch
  set $P0[0], $S0

  elements $I1, $P0
  repeat $S1, "\n\t%s", $I1
  sprintf $S2, $S1, $P0
  .return($S2)

  finish:
    concat $S0, tuning, '?'
    die $S0

.end


