#!/bin/csh -f

#------------------------------------------------------------------------------------
# For now, set streams manually. You must only set as many streams as are declared
#  in the tavg_nml section. For example, if there are three streams:
#  @ s1 = $my_stream
#  @ s2 = $s1 + 1
#  @ s3 = $s2 + 1
#------------------------------------------------------------------------------------

@ my_stream = $1
if ($my_stream < 1) then
   echo invalid my_stream number  ($my_stream)
   exit 5
endif

@ s1 = 1   # use base-model stream 1

cat >! $CASEROOT/Buildconf/popconf/wiso_tavg_contents << EOF
$s1  PREC_16O_F  
$s1  PREC_18O_F  
$s1  PREC_HDO_F  
$s1  EVAP_16O_F  
$s1  EVAP_18O_F  
$s1  EVAP_HDO_F  
$s1  MELT_16O_F  
$s1  MELT_18O_F  
$s1  MELT_HDO_F  
$s1  ROFF_16O_F
$s1  ROFF_18O_F
$s1  ROFF_HDO_F
$s1  IOFF_16O_F
$s1  IOFF_18O_F
$s1  IOFF_HDO_F
$s1  R18O
$s1  RHDO
$s1  FvPER_R18O
$s1  FvPER_RHDO
$s1  FvICE_R18O
$s1  FvICE_RHDO
EOF


if ($OCN_TAVG_TRACER_BUDGET == TRUE) then
cat >> $CASEROOT/Buildconf/popconf/wiso_tavg_contents << EOF
$s1  KPP_SRC_R18O
$s1  KPP_SRC_RHDO
$s1  DIA_IMPVF_R18O
$s1  DIA_IMPVF_RHDO
$s1  HDIFE_R18O
$s1  HDIFE_RHDO
$s1  HDIFN_R18O
$s1  HDIFN_RHDO
$s1  HDIFB_R18O
$s1  HDIFB_RHDO
$s1  UE_R18O
$s1  UE_RHDO
$s1  VN_R18O
$s1  VN_RHDO
$s1  WT_R18O
$s1  WT_RHDO
EOF
endif

#===============================================================================
# The following are fields computed by the WISO modules that are not placed in
# the tavg file by default.
#
#1  WISO_PREC
#1  WISO_DAIR
#1  WISO_RH
#1  WISO_d18OR
#1  Delta18O_EVAP
#1  DeltaD_EVAP
#1  Delta18O_ROFF
#1  DeltaD_ROFF
#$s1  STF_Delta18O
#$s1  STF_DeltaD
#$s1  STF_PREC_18O
#$s1  STF_PREC_HDO
#$s1  STF_EVAP_18O
#$s1  STF_EVAP_HDO
#$s1  STF_MELT_18O
#$s1  STF_MELT_HDO
#$s1  STF_ROFF_18O
#$s1  STF_ROFF_HDO
#$s1  STF_IOFF_18O
#$s1  STF_IOFF_HDO
#$s1  STF_18O
#$s1  STF_HDO
#===============================================================================
