#!/usr/bin/parrot -w

.include 'agate.pir'
.include 'chest.pir'


.sub main :main

  .param pmc argv
  .local int argc, affirm, epoch, ndx
  .local string signat, tuning, course, charte

  elements argc, argv
  $P0 = databank()

  set ndx, 1
  null affirm
  set signat, argv[ndx]
  set tuning, 'eadgbe'
  repeat course, '____ ', 12
  time epoch

  # begin layout
  print "\n"

  eq signat, 'clutch', roost
  lt argc, 2, menu

cycle:
  set signat, argv[ndx]
  exists affirm, $P0[signat]
  unless affirm, menu

  set course, $P0[signat]
  charte = fabricate(signat, tuning, epoch, course)

  say charte
  print "\n"

  inc ndx
  lt ndx, argc, cycle

  print "\n"
  goto conclude

roost:
  iter $P1, $P0

hatch:
  unless $P1 goto perch

  signat = shift $P1
  set course, $P0[signat]
  charte = fabricate(signat, tuning, epoch, course)

  say charte
  print "\n"
  goto hatch

perch:
  print "\n"
  goto conclude

menu:
  charte = <<'TOC'

	j136y7	j167y2	j17	j17y2	j2	j23	j236
	j23k6	j246y3	j26	j26y3	j26y34	j2k56	j2k56x4
	j2k6	j2k6x5	j2k6y3	j2y3	j3	j34k6	j36
	j3k56x4	j3k5x4	j3k6	j6	k157x6	k1j6	k256
	k26	k26x5	k2j17	k2j6	k56	k56x4	k6
	k6x5	n0	n167x4	n26y5	n345	n45y2	n5y2

	k135x4	k345x2	k34	k34x2	k2	k12	k125
	k12j5	k257x1	k25	k25x1	k25x17	k2j56	k2j56y7
	k2j5	k2j5y6	k2j5x1	k2x1	k1	k17j5	k15
	k1j56y7	k1j6y7	k1j5	k5	j346y5	j3k5	j256
	j25	j25y6	j2k34	j2k5	j56	j56y7	j5
	j5y6	n0	n345y7	n25x6	n167	n67x2	n6x2

TOC

  say charte

conclude:
  exit 0

.end


