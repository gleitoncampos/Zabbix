F--===========================================================
-- Copyright (C) 2003 by  HUAWEI 3Com TECHNOLOGIES. All rights reserved.
-- Description: This mib is excerpted from the draft-ietf-hubmib-efm-mib-02 directly
---             only changed the object name,added the h3c as prefix.
-- Reference:
-- Version: V1.1
-- History:
-- V1.0 created by liyue.
--     Define MODULE-IDENTITY for h3cEfmOamMIB
-- V1.1 modified by liuhongxu for h3cDot3OamEventLogEventTotal
--      adjust format by longyin
--=================================================================
   "24-bit Organizationally Unique Identifier.  Information on
          OUIs can be found in IEEE 802-2001 [802-2001] Clause 9."                                                                                2"The MIB module for managing the new Ethernet OAM features
          introduced by the Ethernet in the First Mile task force (IEEE
          802.3ah).  The functionality presented here is based on IEEE
          802.3ah [802.3ah], released in October, 2004.

          In particular, this MIB focused on the changes to Clause 30 of
          the draft that are not specific to any physical layer.  These
          changes are primarily reflected in the new OAM features
          developed under this project, that can be applied to any
          Ethernet like interface. The OAM features are described in
          Clause 57 of [802.3ah].
          This mib is excerpted from the draft files directly,only changed
          the object name,added the h3c as prefix.

          The following reference is used throughout this MIB module:

            [802.3ah] refers to:
              IEEE Std 802.3ah-2004: 'Draft amendment to -
              Information technology - Telecommunications and
              information exchange between systems - Local and
              metropolitan are networks - Specific requirements - Part
              3: Carrier sense multiple access with collision detection
              (CSMA/CD) access method and physical layer specifications
              - Media Access Control Parameters, Physical Layers and
              Management Parameters for subscriber access networks',
              October 2004.

            [802-2001] refers to:
              'IEEE Standard for LAN/MAN (Local Area
              Network/Metropolitan Area Network): Overview and
              Architecture', IEEE 802, June 2001.

          Copyright (c) The Internet Society (2004). This version of
          this MIB module is part of RFC XXXX; See the RFC itself for
          full legal notices. "9"WG Charter:
            http://www.ietf.org/html.charters/hubmib-charter.html
          Mailing lists:
            General Discussion: hubmib@ietf.org
            To Subscribe: hubmib-requests@ietf.org
            In Body: subscribe your_email_address
          Chair: Dan Romascanu, Avaya
            Tel:  +972-3-645-8414
            Email: dromasca@avaya.com
          Editor: Matt Squire
            Hatteras Networks
            Tel:    +1-919-991-5460
            Fax:    +1-919-991-0743
            E-mail: msquire@hatterasnetworks.com
          " "200410240000Z" )"Initial version, published as RFC XXXX."       -- October 24, 2004"
     Y-- RFC Editor: Update XXXX to appropriate RFC number
-- RFC Editor: Remove these notes
    	"Primary controls and status for the OAM capabilities of an
          Ethernet like interface.  There will be one row in this table
          for each Ethernet like interface in the system that supports
          the Ethernet OAM functions defined in [802.3ah]."                       }"An entry in the table, containing information on the Ethernet
          OAM function for a single Ethernet like interface."                      ^"This object is used to provision the default administrative
          OAM mode for this interface.  This object represents the
          desired state of OAM for this interface.

          The h3cDot3OamAdminState always starts in the disabled(1) state
          until an explicity management action or configuration
          information retained by the system causes a transition to the
          enabled(2) state.
          Note that the value of this object is ignored when the
          interface is not operating in full-duplex mode. OAM is not
          supported on half-duplex links.  " "[802.3ah], 30.3.6.1.2"                    �"At initialization and failure conditions, two OAM entities on
          the same full-duplex Ethernet link begin a discovery phase to
          determine what OAM capabilities may be used on that link.  The
          progress of this initialization is controlled by the OAM
          sublayer.

          This value is always disabled(1) if OAM is disabled on this
          interface via the h3cDot3OamAdminState.

          If the link has detected a fault and is transmitting OAMPDUs
          with a link fault indication, the value is linkFault(2).

          The passiveWait(3) state is returned only by OAM entities in
          passive mode (h3cDot3OamMode) and reflects the state in which the
          OAM entity is waiting to see if the peer device is OAM
          capable.  The activeSendLocal(4) is used by active mode
          devices (h3cDot3OamMode) and reflects the OAM entity actively
          trying to discover whether the peer has OAM capability but has
          not yet made that determination.

          The state sendLocalAndRemote(5) reflects that the local OAM
          entity has discovered the peer but has not yet accepted or
          rejected the configuration of the peer.  The local device can,
          for whatever reason, decide that the peer device is
          unacceptable and decline OAM peering.  If the local OAM entity
          rejects the peer OAM entity, the state becomes
          oamPeeringLocallyRejected(7).  If the OAM peering is allowed
          by the local device, the state moves to
          sendLocalAndRemoteOk(6).  Note that both the
          sendLocalAndRemote(5) and oamPeeringLocallyRejected(7) states
          fall within the state SEND_LOCAL_REMOTE of the Discovery state
          diagram [802.3ah, Figure 57-5], with the difference being
          whether the local OAM client has actively rejected the peering
          or has just not indicated any decision yet.  Whether a peering
          decision has been made is indicated via the local flags field
          in the OAMPDU (reflected in the aOAMLocalFlagsField of
          30.3.6.1.10).

          If the remote OAM entity rejects the peering, the state
          becomes oamPeeringRemotelyRejected(8).  Note that both the
          sendLocalAndRemoteOk(6) and oamPeeringRemotelyRejected(8)
          states fall within the state SEND_LOCAL_REMOTE_OK of the
          Discovery state diagram [802.3ah, Figure 57-5], with the
          difference being whether the remote OAM client has rejected
          the peering or has just not yet decided.  This is indicated
          via the remote flags field in the OAM PDU (reflected in the
          aOAMRemoteFlagsField of 30.3.6.1.11).

          When the local OAM entity learns that both it and the remote
          OAM entity have accepted the peering, the state moves to
          operational(9) corresponding to the SEND_ANY state of the
          Discovery state diagram [802.3ah, Figure 57-5].  " 1"[802.3ah], 30.3.6.1.4, 30.3.6.1.10, 30.3.6.1.11"                    b"This object configures the mode of OAM operation for this
          Ethernet like interface.  OAM on Ethernet interfaces may be in
          'active' mode or 'passive' mode.  These two modes differ in
          that active mode provides additional capabilities to initiate
          monitoring activities with the remote OAM peer entity, while
          passive mode generally waits for the peer to initiate OAM
          actions with it.  As an example, an active OAM entity can put
          the remote OAM entity in a loopback state, where a passive OAM
          entity cannot.

          Changing this value results in incrementing the configuration
          revision field of locally generated OAMPDUs (30.3.6.1.12) and
          potentially re-doing the OAM discovery process if the
          h3cDot3OamOperStatus was already operational(9).  " "[802.3ah], 30.3.6.1.3"                    "The largest OAMPDU that the OAM entity supports.  OAM
          entities exchange maximum OAMPDU sizes and negotiate to use
          the smaller of the two maximum OAMPDU sizes between the peers.
          This value is determined by the local implementation.
          " "[802.3ah], 30.3.6.1.8"                    �"The configuration revision of the OAM entity as reflected in
          the latest OAMPDU sent by the OAM entity.  The config revision
          is used by OAM entities to indicate configuration changes have
          occured which might require the peer OAM entity to re-evaluate
          whether the peering is allowed.  See local_satisfied in
          [802.3ah, 57.3.1.2].  " "[802.3ah], 30.3.6.1.12"                    �"The OAM functions supported on this Ethernet like interface.
          OAM consists of separate functional sets beyond the basic
          discovery process which is always required.  These functional
          groups can be supported independently by any implementation.
          These values are communicated to the peer via the local
          configuration field of Information OAMPDUs.  " "[802.3ah], 30.3.6.1.6"                    "Information about the OAM peer for a particular Ethernet like
          interface. OAM entities communicate with a single OAM peer
          entity on full-duplex Ethernet links on which OAM is enabled
          and operating properly.

          In certain states, the OAM peer information is not available.
          Whether peer information is available is communicated via the
          h3cDot3OamPeerStatus object.  When this object is inactive, all
          other information in the row is to be considered invalid.  "                      ?"An entry in the table, containing information on the peer OAM
          entity for a single Ethernet like interface.

          Note that there is at most one OAM peer for each Ethernet like
          interface.  There is exactly one row in this table for each
          Ethernet like interface supporting OAM.  "                      �"This object indicates whether the information in this row
          should be considered valid.  When active(1), the information
          is valid and represents the current peer of the OAM entity.
          When inactive(2), the information in this row is invalid.

          A value of inactive(2) is returned if the h3cDot3OamOperStatus is
          disabled, passiveWait, or activeSendLocal.  For all other
          values of h3cDot3OamOperStatus, a value of active(1) is returned.
          " "N/A"                    �"The MAC address of the peer OAM entity.  The MAC address is
          derived from the most recently received OAMPDU.  This value is
          initialized to all zeros (0x000000000000).  This value is
          invalid if the h3cDot3OamPeerStatus is inactive.

          An OAMPDU is indicated by a valid frame with (1) destination
          MAC address equal to that of the reserved MAC address for Slow
          Protocols (See 43B of [802.3ah]), (2) a lengthOrType field
          equal to the reserved type for Slow Protocols, (3) and a Slow
          Protocols subtype equal to that of the subtype reserved for
          OAM.  " "[802.3ah], 30.3.6.1.5."                    >"The OUI of the OAM peer as reflected in the latest
          Information OAMPDU received with a Local Information TLV.  The
          OUI can be used to identify the vendor of the remote OAM
          entity.  This value is initialized to all zeros (0x000000).
          This value is considered invalid if the h3cDot3OamPeerStatus is
          inactive.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, (4) a OAM code that equals the code
          reserved for Information OAMPDUs.  " "[802.3ah], 30.3.6.1.16."                    �"The Vendor Info of the OAM peer as reflected in the latest
          Information OAMPDU received with a Local Information TLV.  The
          vendor information field is within the Local Information TLV,
          and can be used to determine additional information about the
          peer entity.  The format of the vendor information is
          unspecified within the 32-bit field.  This value is intialized
          to all zeros (0x00000000).  This value is invalid if the
          h3cDot3OamPeerStatus is inactive.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) a OAM code that equals the
          code reserved for Information OAMPDUs.  " "[802.3ah], 30.3.6.1.17."                    �"The mode of the OAM peer as reflected in the latest
          Information OAMPDU received with a Local Information TLV.  The
          mode of the peer can be determined from the Configuration
          field in the Local Information TLV of the last Information
          OAMPDU received from the peer.  This value is initialized to
          unknown(3), and is not valid if the h3cDot3OamPeerStatus is
          inactive.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) a OAM code that equals the
          code reserved for Information OAMPDUs.  " "[802.3ah], 30.3.6.1.7."                    �"The maximum size of OAMPDU supported by the peer as reflected
          in the latest Information OAMPDU received with a Local
          Information TLV.   Ethernet OAM on this interface must not use
          OAMPDUs that exceed this size.  The maximum OAMPDU size can be
          determined from the PDU Configuration field of the Local
          Information TLV of the last Information OAMPDU received from
          the peer.  This value is initialized to 64, and is invalid if
          the h3cDot3OamPeerStatus is inactive.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) a OAM code that equals the
          code reserved for Information OAMPDUs.  " "[802.3ah], 30.3.6.1.9."                    "The configuration revision of the OAM peer as reflected in
          the latest OAMPDU.  This attribute is changed by the peer
          whenever it has a local configuration change for Ethernet OAM
          this interface.  This value is initialized to all zeros
          (0x00000000), and is invalid if the h3cDot3OamPeerStatus is
          inactive.

          The configuration revision can be determined from the Revision
          field of the Local Information TLV of the most recently
          received Information OAMPDU with a Local Information TLV.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) a OAM code that equals the
          code reserved for Information OAMPDUs.  " "[802.3ah], 30.3.6.1.13."                    O"The OAM functions supported on this Ethernet like interface.
          OAM consists of separate functionality sets above the basic
          discovery process.  This value indicates the capabilities of
          the peer OAM entity with respect to these functions.  This
          value is initialized so all bits are clear, and is invalid if
          the h3cDot3OamPeerStatus is inactive.

          The capbilities of the OAM peer can be determined from the
          configuration field of the Local Information TLV of the most
          recently received Information OAMPDU with a Local Information
          TLV.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) a OAM code that equals the
          code reserved for Information OAMPDUs.  " ""[802.3ah], REFERENCE 30.3.6.1.7."                    �"This table contains methods to control the loopback state of
          the local link as well as indicating the status of the
          loopback function.

          Loopback can be used to place the remote OAM entity in a state
          where every received frame (except OAMPDUs) are echoed back
          over the same interface on which they were received.   In this
          state, at the remote entity, 'normal' traffic is disabled as
          only the looped back frames are transmitted on the interface.
          Loopback is thus an intrusive operation that prohibits normal
          data flow and should be used accordingly.  "                      D"An entry in the table, containing information on the loopback
          status for a single Ethernet like interface.  There is an
          entry in this table for every Ethernet like interface on which
          supports OAM and loopback function within OAM (as indicated in
          h3cDot3OamFunctionsSupported).  "                      ?"This attribute initiates or terminates remote loopback with
          an OAM peer.  Writing startRemoteLoopback(2) to this attribute
          cause the local OAM client to send a loopback OAMPDU to the
          OAM peer with the loopback enable flags set.  Writing
          stopRemoteLoopback(3) to this attribute will cause the local
          OAM client to send a loopback OAMPDU to the OAM peer with the
          loopback enable flags cleared.  Writing noLoopback to this
          attribute has no effect.

          Writes to this attribute are ignored unless the OAM status of
          this interface is 'operational' (h3cDot3OamOperStatus).

          The attribute always returns noLoopback on a read.  To
          determine the loopback status, use the attribute
          h3cDot3OamLoopbackStatus.  " "[802.3ah], 57.2.11"                    �"The loopback status of the OAM entity.  This status is
          determined by a combination of the local parser and
          multiplexer states, the remote parser and multiplexer states,
          as well as by the actions of the local OAM client.  When
          operating in normal mode with no loopback in progress, the
          status reads noLoopback(1).

          If the OAM client has sent an Loopback OAMPDU and is waiting
          for a response, where the local parser and multiplexer states
          are DISCARD (see [802.3ah, 57.2.11.1]), the status is
          'initiatingLoopback'.  In this case, the local OAM entity has
          yet to receive any acknowledgement that the remote OAM entity
          has received its loopback command request.

          If the local OAM client knows that the remote OAM entity is in
          loopback mode (via the remote state information as described
          in [802.3ah, 57.2.11.1, 30.3.6.1.15]), the status is
          remoteLoopback(3).  If the local OAM client is in the process
          of terminating the remote loopback [802.3ah, 57.2.11.3,
          30.3.6.1.14], with its local multiplexer and parser states in
          DISCARD, the status is terminatingLoopback(4).  If the remote
          OAM client has put the local OAM entity in loopback mode as
          indicated by its local parser state, the status is
          localLoopback(5).

          The unknown(6) status indicates the parser and multiplexer
          combination is unexpected.  This status may be returned if the
          OAM loopback is in a transition state but should not persist.

          The values of this attribute correspond to the following
          values of the local and remote parser and multiplexer states.

            value            LclPrsr   LclMux    RmtPrsr   RmtMux
            noLoopback         FWD       FWD       FWD       FWD
            initLoopback     DISCARD   DISCARD     FWD       FWD
            rmtLoopback      DISCARD     FWD      LPBK    DISCARD
            tmtngLoopback    DISCARD   DISCARD    LPBK    DISCARD
            lclLoopback        LPBK    DISCARD   DISCARD     FWD
            unknown            ***   any other combination   ***
          " B"[802.3ah], REFERENCE 57.2.11, 30.3.61.14,
          30.3.6.1.15"                    �"Since OAM loopback is a distruptive operation (user traffic
          does not pass), this attribute provides a mechanism to provide
          controls over whether received OAM loopback commands are
          processed or ignored.  When the value is ignore(1), received
          loopback commands are ignored.  When the value is process(2),
          OAM loopback commands are processed.  The default value is to
          ignore loopback commands (ignore(1)).

          The attribute has no meaning if the local OAM entity does not
          support the loopback function (as defined in
          h3cDot3OamFunctionsSupported).  " B"[802.3ah], REFERENCE 57.2.11, 30.3.61.14,
          30.3.6.1.15"                     U"Statistics for the OAM function on a particular Ethernet like
          interface."                       �"An entry in the table, containing statistics information on
          the Ethernet OAM function for a single Ethernet like
          interface."                      �"A count of the number of Information OAMPDUs transmitted on
          this interface.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Information code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.20."                    �"A count of the number of Information OAMPDUs received on this
          interface.

          An Information OAMPDU is indicated by a valid frame with (1)
          destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Information code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.21."                    �"A count of the number of unique Event OAMPDUs transmitted on
          this interface.  Event notifications may be sent in duplicate
          to increase the probability of successfully being received,
          given the possiblity that a frame may be lost in transit.

          An Event Notification OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Event code.

          A unique Event Notification OAMPDU is indicated as an Event
          Notification OAMPDU with a Sequence Number field that is
          distinct from the previously transmitted Event Notification
          OAMPDU Sequence Number.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.22."                    �"A count of the number of unique Event OAMPDUs received on
          this interface.  Event notification OAMPDUs may be sent in
          duplicate to increase the probability of successfully being
          received, given the possiblity that a frame may be lost in
          transit.

          An Event Notification OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Event code.

          A unique Event Notification OAMPDU is indicated as an Event
          Notification OAMPDU with a Sequence Number field that is
          distinct from the previously received Event Notification
          OAMPDU Sequence Number.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.24."                    �"A count of the number of duplicate Event OAMPDUs transmitted
          on this interface.  Event notification OAMPDUs may be sent in
          duplicate to increase the probability of successfully being
          received, given the possiblity that a frame may be lost in
          transit.

          An Event Notification OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Event code.

          A duplicate Event Notification OAMPDU is indicated as an Event
          Notification OAMPDU with a Sequence Number field that is
          identical to the previously transmitted Event Notification
          OAMPDU Sequence Number.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.23."                    �"A count of the number of duplicate Event OAMPDUs received on
          this interface.  Event notification OAMPDUs may be sent in
          duplicate to increase the probability of successfully being
          received, given the possiblity that a frame may be lost in
          transit.

          An Event Notification OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Event code.

          A duplicate Event Notification OAMPDU is indicated as an Event
          Notification OAMPDU with a Sequence Number field that is
          identical to the previously received Event Notification OAMPDU
          Sequence Number.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.25."                    �"A count of the number of Loopback Control OAMPDUs transmitted
          on this interface.

          An Loopback Conrol OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Loopback Control code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.26."                    �"A count of the number of Loopback Control OAMPDUs transmitted
          on this interface.

          An Loopback Control OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Loopback Control code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.27."                    �"A count of the number of Variable Request OAMPDUs transmitted
          on this interface.

          An Variable Request OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Variable Request code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.28."                    �"A count of the number of Variable Request OAMPDUs received on
          this interface.

          An Variable Request OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Variable Request code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.29."                    �"A count of the number of Variable Response OAMPDUs
          transmitted on this interface.

          An Variable Response OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Variable Response code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.30."                    �"A count of the number of Variable Response OAMPDUs received
          on this interface.

          An Variable Response OAMPDU is indicated by a valid frame with
          (1) destination MAC address equal to that of the reserved MAC
          address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Variable Response code.
          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.31."                    	"A count of the number of Organization Specific OAMPDUs
          transmitted on this interface.

          An Organization Specific OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Organization Specific code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.32."                    "A count of the number of Organization Specific OAMPDUs
          received on this interface.

          An Organization Specific OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          OAM Organization Specific code.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.33."                    ("A count of the number of OAMPDUs transmitted  on this
          interface with an unsupported op-code.

          An unsupported opcode OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          opcode for a function that is not supported by the device.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.18."                    $"A count of the number of OAMPDUs received on this interface
          with an unsupported op-code.

          An unsupported opcode OAMPDU is indicated by a valid frame
          with (1) destination MAC address equal to that of the reserved
          MAC address for Slow Protocols (See 43B of [802.3ah]), (2) a
          lengthOrType field equal to the reserved type for Slow
          Protocols, (3) a Slow Protocols subtype equal to that of the
          subtype reserved for OAM, and (4) an OAMPDU code equals the
          opcode for a function that is not supported by the device.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.19."                    �"A count of the number of frames that were dropped by the OAM
          multiplexer.  Since the OAM mulitplexer has multiple inputs
          and a single output, there may be cases where frames are
          dropped due to transmit resource contention.  This counter is
          incremented whenever a frame is dropped by the OAM layer.
          When this counter is incremented, no other counters in this
          MIB are incremented.

          Discontinuities of this counter can occur at re-initialization
          of the management system, and at other times as indicated by
          the value of the ifCounterDiscontinuityTime.  " "[802.3ah], 30.3.6.1.46."                    q"Ethernet OAM includes the ability to generate and receive
          event notifications to indicate various link problems.  This
          table contains the mechanisms to configure the thresholds to
          generate the standard Ethernet OAM events.

          These events are:
            - Errored Symbol Period Event.  Generated when the number of
              symbol errors exceeds a threshold within a given window
              defined by a number of symbols (e.g. 1,000 symbols out of
              1,000,000 had errors).
            - Errored Frame Period Event.  Generated when the number of
              frame errors exceeds a threshold within a given window
              defined by a number of frames (e.g. 10 frames out of 1000
              had errors).
            - Errored Frame Event.  Generated when the number of frame
              errors exceeds a threshold within a given window defined
              by a period of time (e.g. 10 frames in 1 second had
              errors).
            - Errored Frame Seconds Summary Event.  Generated when the
              number of errored frame seconds exceeds a threshold within
              a given time period (e.g. 10 errored frame seconds within
              the last 100 seconds).  An errored frame second is defined
              as a 1 second interval which had >0 frame errors.
          "                      g"Event configuration information is available for every
          Ethernet like interface that supports OAM and the event
          function of OAM as indicated in the h3cDot3OamFunctionsSupported
          attribute.

          Event configuration controls when the local management entity
          sends Event Notification OAMPDUs to its OAM peer.  "                      �"The two objects h3cDot3OamErrSymPeriodWindowHi and
          h3cDot3OamErrSymPeriodLo together form an unsigned 64-bit
          integer representing the number of symbols over which this
          threshold event is defined.  This is defined as
          h3cDot3OamErrSymPeriodWindow = ((2^32)*h3cDot3OamErrSymPeriodWindowHi)
                                          + h3cDot3OamErrSymPeriodWindowLo

          If h3cDot3OamErrSymPeriodThreshold symbol errors occur within a
          window of h3cDot3OamErrSymPeriodWindow symbols, an Event
          Notification OAMPDU should be generated with an Errored Symbol
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.34"                    �"The two objects h3cDot3OamErrSymPeriodWindowHi and
          h3cDot3OamErrSymPeriodWindowLo together form an unsigned 64-bit
          integer representing the number of symbols over which this
          threshold event is defined.  This is defined as

        h3cDot3OamErrSymPeriodWindow = ((2^32)*h3cDot3OamErrSymPeriodWindowHi)
                                          + h3cDot3OamErrSymPeriodWindowLo

          If h3cDot3OamErrSymPeriodThreshold symbol errors occur within a
          window of h3cDot3OamErrSymPeriodWindow symbols, an Event
          Notification OAMPDU should be generated with an Errored Symbol
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.34"                    +"The two objects h3cDot3OamErrSymPeriodThresholdHi and
          h3cDot3OamErrSymPeriodThresholdLo together form an unsigned
          64-bit integer representing the number of symbol errors that
          must occur within a given window to cause this event.

          This is defined as

            h3cDot3OamErrSymPeriodThreshold =
                              ((2^32) * h3cDot3OamErrSymPeriodThresholdHi)
                                      + h3cDot3OamErrSymPeriodThresholdLo
          If h3cDot3OamErrSymPeriodThreshold symbol errors occur within a
          window of h3cDot3OamErrSymPeriodWindow symbols, an Event
          Notification OAMPDU should be generated with an Errored Symbol
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.34"                    /"The two objects h3cDot3OamErrSymPeriodThresholdHi and
          h3cDot3OamErrSymPeriodThresholdLo together form an unsigned
          64-bit integer representing the number of symbol errors that
          must occur within a given window to cause this event.

          This is defined as

            h3cDot3OamErrSymPeriodThreshold =
                              ((2^32) * h3cDot3OamErrSymPeriodThresholdHi)
                                      + h3cDot3OamErrSymPeriodThresholdLo


          If h3cDot3OamErrSymPeriodThreshold symbol errors occur within a
          window of h3cDot3OamErrSymPeriodWindow symbols, an Event
          Notification OAMPDU should be generated with an Errored Symbol
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.34"                    �"Indicates whether the occurence of Errored Symbol Period
          Events should result in Event Notification OAMPDUs generated
          by the OAM layer.

          By default, this object should have the value enabled(1) for
          Ethernet like interfaces that support OAM.  If the OAM layer
          does not support event notifications (as indicated via the
          h3cDot3OamFunctionsSupported attribute), this value is ignored.
          " "N/A"                    z"The number of frames over which the threshold is defined.

          If h3cDot3OamErrFramePeriodThreshold frame errors occur within a
          window of h3cDot3OamErrFramePeriodWindow frames, an Event
          Notification OAMPDU should be generated with an Errored Frame
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.38"                    �"The number of frame errors that must occur for this event to
          be triggered.

          If h3cDot3OamErrFramePeriodThreshold frame errors occur within a
          window of h3cDot3OamErrFramePeriodWindow frames, an Event
          Notification OAMPDU should be generated with an Errored Frame
          Period Event TLV indicating the threshold has been crossed in
          this window.  " "[802.3ah], 30.3.6.1.38"                    �"Indicates whether the occurence of an Errored Frame Period
          Event should result in an Event Notification OAMPDU generated
          by the OAM layer.

          By default, this object should have the value enabled(1) for
          Ethernet like interfaces that support OAM.  If the OAM layer
          does not support event notifications (as indicated via the
          h3cDot3OamFunctionsSupported attribute), this value is ignored. " "N/A"                    �"The amount of time (in 100ms increments) over which the
          threshold is defined.

         If h3cDot3OamErrFrameThreshold frame errors occur within a window
         of h3cDot3OamErrFrameWindow seconds (measured in tenths of
         seconds), an Event Notification OAMPDU should be generated with
         an Errored Frame Event TLV indicating the threshold has been
         crossed in this window.  " "[802.3ah], 30.3.6.1.36"                    �"The number of frame errors that must occur for this event to
          be triggered.

          If h3cDot3OamErrFrameThreshold frame errors occur within a window
          of h3cDot3OamErrFrameWindow (in tenths of seconds), an Event
          Notification OAMPDU should be generated with an Errored Frame
          Event TLV indicating the threshold has been crossed in this
          window.  " "[802.3ah], 30.3.6.1.36"                    �"Indicates whether the occurence of an Errored Frame Event
          should result in an Event Notification OAMPDU generated by the
          OAM layer.

          By default, this object should have the value enabled(1) for
          Ethernet like interfaces that support OAM.  If the OAM layer
          does not support event notifications (as indicated via the
          h3cDot3OamFunctionsSupported attribute), this value is ignored. " "N/A"                    �"The amount of time (in 100ms intervals) over which the
          threshold is defined.

          If h3cDot3OamErrFrameSecsSummaryThreshold frame errors occur
          within a window of h3cDot3OamErrFrameSecsSummaryWindow (in tenths
          of seconds), an Event Notification OAMPDU should be generated
          with an Errored Frame Seconds Summary Event TLV indicating the
          threshold has been crossed in this window.  " "[802.3ah], 30.3.6.1.40"                    �"The number of errored frame seconds that must occur for this
          event to be triggered.

          If h3cDot3OamErrFrameSecsSummaryThreshold frame errors occur
          within a window of h3cDot3OamErrFrameSecsSummaryWindow (in tenths
          of seconds), an Event Notification OAMPDU should be generated
          with an Errored Frame Seconds Summary Event TLV indicating the
          threshold has been crossed in this window.  " "[802.3ah], 30.3.6.1.40"                    �"Indicates whether the occurence of an Errored Frame Seconds
          Summary Event should result in an Event Notification OAMPDU
          generated by the OAM layer.

          By default, this object should have the value enabled(1) for
          Ethernet like interfaces that support OAM.  If the OAM layer
          does not support event notifications (as indicated via the
          h3cDot3OamFunctionsSupported attribute), this value is ignored." "N/A"                    �"This table records a history of the events that have occurred
          at the Ethernet OAM level.  These events can include locally
          detected events, which may result in locally generated
          OAMPDUs, and remotely detected events, which are detected by
          the OAM peer entity and signaled to the local entity via
          Ethernet OAM.  Ethernet OAM events can be signaled by Event
          Notification OAMPDUs or by the flags field in any OAMPDU.  "                       *"An entry in the h3cDot3OamEventLogTable."                       \"An arbitrary integer for identifiying individual events
          within the event log.  " "N/A"                     7"The date and time that this event instance occurred. " "N/A"                    �"The OUI of the entity defining the object type.  All IEEE
          802.3 defined events (as appearing in [802.3ah] except for the
          Organizationally Unique Event TLVs) use the IEEE 802.3 OUI of
          0x0180C2.  Organizations defining their own Event Notification
          TLVs include their OUI in the Event Notification TLV which
          gets reflected here.  " "N/A"                    �"The type of event that generated this entry in the event log.

          When the OUI is the IEEE 802.3 OUI of 0x0180C2, the following
          event types are defined:
              erroredSymbolEvent(1),
              erroredFramePeriodEvent (2),
              erroredFrameEvent(3),
              erroredFrameSecondsEvent(4),
              linkFault(256),
              dyingGaspEvent(257),
              criticalLinkEvent(258)
          The first four are considered threshold crossing events as
          they are generated when a metric exceeds a given value within
          a specified window.  The other three are not threshold
          crossing events.

          When the OUI is not 0x0180C2, then some other organization has
          defined the event space.  If event subtyping is known to the
          implementation, it may be reflected here.  Otherwise, this
          value should return all Fs (0xFFFFFFFF).
          " $"[802.3ah], 30.3.6.1.10 and 57.5.3."                     e"Whether this event occurred locally, or was received from the
          OAM peer via Ethernet OAM." "N/A"                    �"If the event represents a threshold crossing event, the two
          objects h3cDot3OamEventWindowHi and h3cDot3OamEventWindowLo form an
          unsigned 64-bit integer yielding the window over which the
          value was measured for the threshold crossing event (e.g. 5,
          when 11 occurrences happened in 5 seconds while the threshold
          was 10).   The two objects are combined as:

          h3cDot3OamEventLogWindow = ((2^32) * h3cDot3OamEventLogWindowHi)
                                          + h3cDot3OamEventLogWindowLo


          Otherwise, this value is returned as all F's (0xFFFFFFFF) and
          adds no useful information.  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    �"If the event represents a threshold crossing event, the two
          objects h3cDot3OamEventWindowHi and h3cDot3OamEventWindowLo form an
          unsigned 64-bit integer yielding the window over which the
          value was measured for the threshold crossing event (e.g. 5,
          when 11 occurrences happened in 5 seconds while the threshold
          was 10).   The two objects are combined as:
          h3cDot3OamEventLogWindow = ((2^32) * h3cDot3OamEventLogWindowHi)
                                          + h3cDot3OamEventLogWindowLo

          Otherwise, this value is returned as all F's (0xFFFFFFFF) and
          adds no useful information.  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    �"If the event represents a threshold crossing event, the two
          objects h3cDot3OamEventThresholdHi and h3cDot3OamEventThresholdLo
          form an unsigned 64-bit integer yielding the value that was
          crossed for the threshold crossing event (e.g. 10, when 11
          occurrences happened in 5 seconds while the threshold was 10).
          The two objects are combined as:

        h3cDot3OamEventLogThreshold = ((2^32) * h3cDot3OamEventLogThresholdHi)
                                           + h3cDot3OamEventLogThresholdLo

          Otherwise, this value is returned as all F's (0xFFFFFFFF) and
          adds no useful information.  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    �"If the event represents a threshold crossing event, the two
          objects h3cDot3OamEventThresholdHi and h3cDot3OamEventThresholdLo
          form an unsigned 64-bit integer yielding the value that was
          crossed for the threshold crossing event (e.g. 10, when 11
          occurrences happened in 5 seconds while the threshold was 10).
          The two objects are combined as:

        h3cDot3OamEventLogThreshold = ((2^32) * h3cDot3OamEventLogThresholdHi)
                                           + h3cDot3OamEventLogThresholdLo

          Otherwise, this value is returned as all F's (0xFFFFFFFF) and
          adds no useful information.  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    �"If the event represents a threshold crossing event, this
          value indicates the value of the parameter within the given
          window that generated this event (e.g. 11, when 11 occurrences
          happened in 5 seconds while the threshold was 10).

          Otherwise, this value is returned as all F's
          (0xFFFFFFFFFFFFFFFF) and adds no useful information.
          " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    0"This value respresents the total number of times this
          occurence has happened since the last reset (e.g. 3253, when
          3253 symbol errors have occurred since the last reset, which
          has resulted in 51 symbol error threshold crossing events
          since the last reset).  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                    6"This value respresents the total number of times one or more
          of these occurences have resulted in an event (e.g. 51 when
          3253 symbol errors have occurred since the last reset, which
          has resulted in 51 symbol error threshold crossing events
          since the last reset).  " &"[802.3ah], 30.3.6.1.37 and 57.5.3.2."                            M"A h3cDot3OamThresholdEvent notification is sent when a local or
          remote threshold crossing event is detected.  A local
          threshold crossing event is detected by the local entity,
          while a remote threshold crossing event is detected by the
          reception of an Ethernet OAM Event Notification OAMPDU
          indicating a threshold event.

          This notification should not be sent more than once per
          second.

          The management entity should periodically check
          h3cDot3OamEventLogTable to detect any missed events."                ."A h3cDot3OamNonThresholdEvent notification is sent when a local
          or remote non-threshold crossing event is detected.  A local
          event is detected by the local entity, while a remote event is
          detected by the reception of an Ethernet OAM Event
          Notification OAMPDU indicating a non-threshold crossing event.
          This notification should not be sent more than once per
          second.

          The management entity should periodically check
          h3cDot3OamEventLogTable to detect any missed events."                         t"A collection of objects providing the abilities,
          configuration, and status of an Ethernet OAM entity.  "                 x"A collection of objects providing the abilities,
          configuration, and status of a peer Ethernet OAM entity.  "                N"A collection of objects providing the statistics for the
          number of various transmit and recieve events for OAM on an
          Ethernet like interface.  Note that all of these counters must
          be supported even if the related function (as described in
          h3cDot3OamFunctionsSupported) is not supported.  "                 X"A collection of objects for controlling the OAM remote
          loopback function.  "                "A collection of objects for configuring the thresholds for an
          Errored Symbol Period Event.

          Each [802.3ah] defined Event Notification TLV has its own
          conformance group because each event can be implemented
          independently of any other.  "                "A collection of objects for configuring the thresholds for an
          Errored Frame Period Event.

          Each [802.3ah] defined Event Notification TLV has its own
          conformance group because each event can be implemented
          independently of any other.  "                "A collection of objects for configuring the thresholds for an
          Errored Frame Event.

          Each [802.3ah] defined Event Notification TLV has its own
          conformance group because each event can be implemented
          independently of any other.  "                ""A collection of objects for configuring the thresholds for an
          Errored Frame Seconds Summary Event.

          Each [802.3ah] defined Event Notification TLV has its own
          conformance group because each event can be implemented
          independently of any other.  "                 �"A collection of objects for configuring the thresholds for an
          Errored Frame Seconds Summary Event and maintaining the event
          information.  "                 �"A collection of notifications used by Ethernet OAM to signal
         to a management entity that local or remote events have occured
         on a specified Ethernet link."                         �"The compliance statement for managed entities
                     supporting OAM on Ethernet like interfaces.
                     "   q"This group is mandatory for all IEEE 802.3 OAM
          implementations that support loopback functionality. " n"This group is mandatory for all IEEE 802.3 OAM
          implementations that support event functionality. " n"This group is mandatory for all IEEE 802.3 OAM
          implementations that support event functionality. " n"This group is mandatory for all IEEE 802.3 OAM
          implementations that support event functionality. " n"This group is mandatory for all IEEE 802.3 OAM
          implementations that support event functionality. " L"This group is optional for all IEEE 802.3 OAM
          implementations. " L"This group is optional for all IEEE 802.3 OAM
          implementations. "                