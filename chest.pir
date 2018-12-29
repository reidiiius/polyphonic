#!/usr/bin/parrot -w


.sub zilch
  null $I0
  .return($I0)
.end


.sub tune
  .param int nu
  .param string qp
  .local string head, tail, druk
  head = substr qp, nu, 60
  tail = substr qp,  0, nu
  druk = concat head, tail
  .return(druk)
.end


.sub peg_Bj
  .param string qp
  .local string value
  value = tune(50, qp)
  .return(value)
.end


.sub peg_Fn
  .param string qp
  .local string value
  value = tune(25, qp)
  .return(value)
.end


.sub peg_Cn
  .param string qp
  .local string value
  value = tune( 0, qp)
  .return(value)
.end


.sub peg_Gn
  .param string qp
  .local string value
  value = tune(35, qp)
  .return(value)
.end


.sub peg_Dn
  .param string qp
  .local string value
  value = tune(10, qp)
  .return(value)
.end


.sub peg_An
  .param string qp
  .local string value
  value = tune(45, qp)
  .return(value)
.end


.sub peg_En
  .param string qp
  .local string value
  value = tune(20, qp)
  .return(value)
.end


.sub peg_Bn
  .param string qp
  .local string value
  value = tune(55, qp)
  .return(value)
.end


.sub peg_Fk
  .param string qp
  .local string value
  value = tune(30, qp)
  .return(value)
.end


.sub ennead
  .param string signat
  .param string course
  .param string epoch
  .local string diadem, temp

  temp = concat signat, '-ennead-m'
  diadem = concat temp, epoch

  set $S0, course
  $S1 = peg_Bj($S0)
  $S2 = peg_Fn($S0)
  $S3 = peg_Cn($S0)
  $S4 = peg_Gn($S0)
  $S5 = peg_Dn($S0)
  $S6 = peg_An($S0)
  $S7 = peg_En($S0)
  $S8 = peg_Bn($S0)
  $S9 = peg_Fk($S0)

  new  $P0, 'ResizablePMCArray'
  push $P0, diadem
  push $P0, $S1
  push $P0, $S2
  push $P0, $S3
  push $P0, $S4
  push $P0, $S5
  push $P0, $S6
  push $P0, $S7
  push $P0, $S8
  push $P0, $S9

  $S10 = repeat "\n\t%s", 10
  sprintf $S11, $S10, $P0
  .return($S11)

.end


