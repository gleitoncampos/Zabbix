R-- =============================================================
-- Copyright (c) 2004-2010 Hangzhou H3C Tech. Co., Ltd. All rights reserved.
--
-- Description:
-- Reference: Extension of RFC 1213 and RFC 2233
-- Version: V1.2
-- History:
--   V1.0 2004-12-01
--        Initial Version  by lizhiyong and fangmin
--   V1.1 2009-06-08 modified by TONGWEI
--        Added h3ce1Table and h3ce1InterfaceTable
--   V1.2 2010-04-08 modified by Tong Wei
--        Modified h3ce1Table
--        Added h3ce1TimeSlotSetTable
-- =============================================================
  �"Each octet within this value specifies a set of time
            slots, with the first octet specifying time slot 1 through
            8, the second octet specifying time slots 9 through 16, etc.
            Within each octet, the most significant bit represents
            the highest numbered time slot, and the least significant bit
            represents the lowest numbered time slot.  Thus, each time slot
            of the E1 is represented by a single bit within the
            value of this object.  If that bit has a value of '1'
            then that time slot is included in the set of time slots;
            the time slot is not included if its bit has a value of '0'."                                     e"This MIB provides E1 interface information that are
             excluded by RFC 1213 and RFC 2233" �"Platform Team H3C Technologies Co., Ltd.
             Hai-Dian District Beijing P.R. China
             http://www.h3c.com
             Zip: 100085" "201004081855Z" "200906081741Z" "200412011436Z" "To fix bugs in the MIB file." "To fix bugs in the MIB file." %"Initial version of this MIB module."       -- Apr. 8, 2010 at 18:55 GMT
       7"This  table contains E1 interface packet statistics  "                       �"This entry contains E1 interface packet statistics.
         The index of this Entry is ifIndex defined in ifTable
         of RFC1213-MIB"                       6"The total number of error received on this interface"                       H"The number of Runts Error(too short packet) received on this interface"                       H"The number of Giants Error(too long packet) received on this interface"                       4"The number of CRC Error received on this interface"                       6"The number of Align Error received on this interface"                       :"The number of Over Runs Error received on this interface"                       ("The number of dribble packets received"                       ;"The number of AbortedSeq Error received on this interface"                       +"The number of Error (no buffer available)"                       "The number of framing Errors"                       8"The number of total Error transmited on this interface"                       ;"The number of UnderRun Error transmited on this interface"                       ="The number of Collisions Error transmited on this interface"                       ;"The number of Deferred Error transmited on this interface"                       !"A list of E1 interface entries."                       :"This entry contains E1 interface management information."                       �"Specifies the type of the E1 interface.
          Now it supports types as follow:
          voice  voice type
          pos    POS type"                       4"Specifies the clock type used on the E1 interface."                       6"Specifies the frame format used on the E1 interface."                       8"Specifies the line code type used on the E1 interface."                       �"This is a bit-map of PRI time slots used on the E1 interface.
         It needs to administratively shut down the D channel of
         the E1 interface before cancelling PRI time slots."                       ;"This is the ifIndex of the D channel of the E1 interface."                       S"This is the ifIndex of the subscriber-line channel of the E1
         interface."                       `"This is the ifIndex of the FCM (Fast Connection Modem) channel
          of the E1 interface."                       j"A list of channels of E1 interface entries.
         Including D channels and subscriber-line channels."                       �"This entry contains channels of E1 interface management information.
         Including D channels and subscriber-line channels."                       1"Which E1 interface is this channel belonged to."                       >"A list of time slot set information of E1 interface entries."                       @"This entry contains time slot set information of E1 interface."                       "Group ID."                      �"Signal type. Now it supports types as follow:
            unkown,      unkown
            em-delay     E&M Delay Dial
            em-immediate E&M Immediate Start
            em-wink      E&M Wink Start
            fxo-ground   FXO Ground Start
            fxo-loop     FXO Loop Start
            fxs-ground   FXS Ground Start
            fxs-loop     FXS Loop Start
            r2           R2 ITU Q421"                       "Time slot bit map."                       "Operation status."                                  