    2"An integer which may be used as a new Index in a table.

       The special value of 0 indicates that no more new entries can
       be created in the relevant table.

       When a MIB is used for configuration, an object with this
       SYNTAX always contains a legal value (if non-zero) for an
       index that is not currently used in the relevant table. The
       Command Generator (Network Management Application) reads this
       variable and uses the (non-zero) value read when creating a
       new row with an SNMP SET.  When the SET is performed, the
       Command Responder (agent) must determine whether the value is
       indeed still unused; Two Network Management Applications may
       attempt to create a row (configuration entry) simultaneously
       and use the same value. If it is currently unused, the SET
       succeeds and the Command Responder (agent) changes the value
       of this object, according to an implementation-specific
       algorithm.  If the value is in use, however, the SET fails.
       The Network Management Application must then re-read this
       variable to obtain a new usable value.

       An OBJECT-TYPE definition using this SYNTAX MUST specify the
       relevant table for which the object is providing this
       functionality.
      "             &"802.1ag clause 21.6.5.4, Table 21-20"�"A value that represents a type (and thereby the format)
        of a Dot1agCfmMaintAssocName.  The value can be one of
        the following:

        ieeeReserved(0)   Reserved for definition by IEEE 802.1
                          recommend to not use zero unless
                          absolutely needed.
        primaryVid(1)     Primary VLAN ID.
                          12 bits represented in a 2-octet integer:
                          - 4 least significant bits of the first
                            byte contains the 4 most significant
                            bits of the 12 bits primary VID
                          - second byte contains the 8 least
                            significant bits of the primary VID

                                 0 1 2 3 4 5 6 7 8
                                 +-+-+-+-+-+-+-+-+
                                 |0 0 0 0| (MSB) |
                                 +-+-+-+-+-+-+-+-+
                                 |  VID   LSB    |
                                 +-+-+-+-+-+-+-+-+

        charString(2)     RFC2579 DisplayString, except that the
                          character codes 0-31 (decimal) are not
                          used. (1..45) octets
        unsignedInt16 (3) 2-octet integer/big endian
        rfc2865VpnId(4)   RFC 2685 VPN ID
                          3 octet VPN authority Organizationally
                          Unique Identifier followed by 4 octet VPN
                          index identifying VPN according to the OUI:

                                 0 1 2 3 4 5 6 7 8
                                 +-+-+-+-+-+-+-+-+
                                 | VPN OUI (MSB) |
                                 +-+-+-+-+-+-+-+-+
                                 |   VPN OUI     |
                                 +-+-+-+-+-+-+-+-+
                                 | VPN OUI (LSB) |
                                 +-+-+-+-+-+-+-+-+
                                 |VPN Index (MSB)|
                                 +-+-+-+-+-+-+-+-+
                                 |  VPN Index    |
                                 +-+-+-+-+-+-+-+-+
                                 |  VPN Index    |
                                 +-+-+-+-+-+-+-+-+
                                 |VPN Index (LSB)|
                                 +-+-+-+-+-+-+-+-+

        ieeeReserved(xx)  Reserved for definition by IEEE 802.1
                          xx values can be [5..31] and [64..255]
        ituReserved(xx)   Reserved for definition by  ITU-T Y.1731
                          xx values range from [32..63]

        To support future extensions, the Dot1agCfmMaintAssocNameType
        textual convention SHOULD NOT be sub-typed in object type
        definitions.  It MAY be sub-typed in compliance statements in
        order to require only a subset of these address types for a
        compliant implementation.

        Implementations must ensure that Dot1agCfmMaintAssocNameType
        objects and any dependent objects (e.g.,
        Dot1agCfmMaintAssocName objects) are consistent.  An
        inconsistentValue error must be generated if an attempt to
        change an Dot1agCfmMaintAssocNameType object would, for
        example, lead to an undefined Dot1agCfmMaintAssocName value.
        In particular,
        Dot1agCfmMaintAssocNameType/Dot1agCfmMaintAssocName pairs
        must be changed together if the nameType changes.

        The Maintenance Domain name and Maintenance Association name,
        when put together into the CCM PDU, MUST total 48 octets or
        less.  If the Dot1agCfmMaintDomainNameType object contains
        none(1), then the Dot1agCfmMaintAssocName object MUST be
        45 octets or less in length.  Otherwise, the length of
        the Dot1agCfmMaintDomainName object plus the length of the
        Dot1agCfmMaintAssocName object, added together, MUST total
        less than or equal to 44 octets.
       "             &"802.1ag clauses 12.14.7.6.3:b, 20.22"}"Operational state of the remote MEP state machine.  This
        state machine monitors the reception of valid CCMs from a
        remote MEP with a specific MEPID.  It uses a timer that
        expires in 3.5 times the length of time indicated by the
        dot1agCfmMaNetCcmInterval object.

        rMepIdle(1)            Momentary state during reset.

        rMepStart(2)           The timer has not expired since the
                               state machine was reset, and no valid
                               CCM has yet been received.

        rMepFailed(3)          The timer has expired, both since the
                               state machine was reset, and since a
                               valid CCM was received.

        rMepOk(4)              The timer has not expired since a
                               valid CCM was received.
        "             L"802.1ag clauses 12.14.7.5.3:g, 20.36.2.5, 21.9.5, and
        Table 21-27" 2"Possible values the Relay action field can take."             )"802.1ag clause 12.14.7.1.3:k and 20.9.5"�"An integer value specifying the lowest priority defect
        that is allowed to generate a Fault Alarm (20.9.5), either:

        allDef(1)           DefRDICCM, DefMACstatus, DefRemoteCCM,
                            DefErrorCCM, and DefXconCCM;
        macRemErrXcon(2)    Only DefMACstatus, DefRemoteCCM,
                            DefErrorCCM, and DefXconCCM (default);
        remErrXcon(3)       Only DefRemoteCCM, DefErrorCCM,
                            and DefXconCCM;
        errXcon(4)          Only DefErrorCCM and DefXconCCM;
        xcon(5)             Only DefXconCCM; or
        noXcon(6)           No defects DefXcon or lower are to be
                            reported;
       "             ("802.1ag clause 12.14.7.1.3:f and 20.35"S"Indicates the diferent states of the MEP Fault Notification
        Generator State Machine.

        fngReset(1)            No defect has been present since the
                               dot1agCfmMepFngResetTime timer
                               expired, or since the state machine
                               was last reset.

        fngDefect(2)           A defect is present, but not for a
                               long enough time to be reported
                               (dot1agCfmMepFngAlarmTime).

        fngReportDefect(3)     A momentary state during which the
                               defect is reported by sending a
                               dot1agCfmFaultAlarm notification,
                               if that action is enabled.

        fngDefectReported(4)   A defect is present, and some defect
                               has been reported.

        fngDefectClearing(5)   No defect is present, but the
                               dot1agCfmMepFngResetTime timer has
                               not yet expired.
       "             $"802.1ag clause 21.6.5, Table 21-19"?"A value that represents a type (and thereby the format)
        of a Dot1agCfmMaintDomainName.  The value can be one of
        the following:


        ieeeReserved(0)   Reserved for definition by IEEE 802.1
                          recommend to not use zero unless
                          absolutely needed.
        none(1)           No format specified, usually because
                          there is not (yet) a Maintenance
                          Domain Name. In this case, a zero
                          length OCTET STRING for the Domain
                          Name field is acceptable.
        dnsLikeName(2)    Domain Name like string, globally unique
                          text string derived from a DNS name.
        macAddrAndUint(3) MAC address + 2-octet (unsigned) integer.
        charString(4)     RFC2579 DisplayString, except that the
                          character codes 0-31 (decimal) are not
                          used.
        ieeeReserved(xx)  Reserved for definition by IEEE 802.1
                          xx values can be [5..31] and [64..255]
        ituReserved(xx)   Reserved for definition by  ITU-T Y.1731
                          xx values range from [32..63]

        To support future extensions, the Dot1agCfmMaintDomainNameType
        textual convention SHOULD NOT be sub-typed in object type
        definitions.  It MAY be sub-typed in compliance statements in
        order to require only a subset of these address types for a
        compliant implementation.

        Implementations must ensure that Dot1agCfmMaintDomainNameType
        objects and any dependent objects (e.g.,
        Dot1agCfmMaintDomainName objects) are consistent.  An
        inconsistentValue error must be generated if an attempt to
        change an Dot1agCfmMaintDomainNameType object would, for
        example, lead to an undefined Dot1agCfmMaintDomainName value.
        In particular,
        Dot1agCfmMaintDomainNameType/Dot1agCfmMaintDomainName pairs
        must be changed together if the nameType changes.
       "             "802.1ag clause 21.6.5"�"Denotes a generic Maintenance Domain Name.

        A Dot1agCfmMaintDomainName value is always interpreted within
        the context of a Dot1agCfmMaintDomainNameType value.  Every
        usage of the Dot1agCfmMaintDomainName textual convention is
        required to specify the Dot1agCfmMaintDomainNameType object
        that provides the context.  It is suggested that the
        Dot1agCfmMaintDomainNameType object be logically registered
        before the object(s) that use the Dot1agCfmMaintDomainName
        textual convention, if they appear in the same logical row.

        The value of a Dot1agCfmMaintDomainName object must always
        be consistent with the value of the associated
        Dot1agCfmMaintDomainNameType object. Attempts to set
        an Dot1agCfmMaintDomainName object to a value inconsistent
        with the associated Dot1agCfmMaintDomainNameType must fail
        with an inconsistentValue error.

        When this textual convention is used as the syntax of an
        index object, there may be issues with the limit of 128
        sub-identifiers specified in SMIv2, IETF STD 58.  In this
        case, the object definition MUST include a 'SIZE' clause
        to limit the number of potential instance sub-identifiers;
        otherwise the applicable constraints MUST be stated in
        the appropriate conceptual row DESCRIPTION clauses, or
        in the surrounding documentation if there is no single
        DESCRIPTION clause that is appropriate.

        A value of none(1) in the associated
        Dot1agCfmMaintDomainNameType object means that no Maintenance
        Domain name is present, and the contents of the
        Dot1agCfmMaintDomainName object are meaningless.

        See the DESCRIPTION of the Dot1agCfmMaintAssocNameType
        TEXTUAL-CONVENTION for a discussion of the length limits on
        the Maintenance Domain name and Maintenance Association name.
       "             !"802.1ag clauses 3.18 and 19.2.1" �"Maintenance association End Point Identifier (MEPID): A small
        integer, unique over a given Maintenance Association,
        identifying a specific MEP.
       "             O"802.1ag clauses 12.14.7.5.3:o, 20.36.2.10, 21.9.9.1, and
        Table 21-32" 5"Possible values returned in the egress action field"              �"The VLAN-ID that uniquely identifies a specific VLAN,
        or no VLAN.  The special value of zero is used to
        indicate that no VLAN-ID is present or used.  This can
        be used in any situation where an object or a table entry
        must refer either to a specific VLAN, or to no VLAN.

        Note that a MIB object that is defined using this
        TEXTUAL-CONVENTION should clarify the meaning of
        'no VLAN' (i.e., the special value 0)."             2"802.1ag clause 12.14.7.6.3:f, 20.19.3 and 21.5.4"�"An enumerated value from he Port Status TLV from the last CCM
        received from the last MEP. It indicates the ability of the
        Bridge Port on which the transmitting MEP resides to pass
        ordinary data, regardless of the status of the MAC
        (Table 21-10).

        psNoPortStateTLV(0) Indicates either that no CCM has been
                            received or that no port status TLV was
                            present in the last CCM received.

        psBlocked(1)        Ordinary data cannot pass freely through
                            the port on which the remote MEP resides.
                            Value of enableRmepDefect is equal to
                            false.

        psUp(2):            Ordinary data can pass freely through
                            the port on which the remote MEP resides.
                            Value of enableRmepDefect is equal to
                            true.

        NOTE: A 0 value is used for psNoPortStateTLV, so that
              additional code points can be added in a manner
              consistent with the Dot1agCfmInterfaceStatus textual
              convention.
       "             )"802.1ag clause 12.14.6.1.3:d and 21.5.3"6"Indicates what, if anything, is to be included in the Sender
        ID TLV transmitted in CCMs, LBMs, LTMs, and LTRs.  The valid
        values are:

        sendIdNone(1)      The Sender ID TLV is not to be sent.
        sendIdChassis(2)   The Chassis ID Length, Chassis ID
                           Subtype, and Chassis ID fields of  the
                           Sender ID TLV are to be sent.
        sendIdManage(3)    The Management Address Length and
                           Management Address of the Sender ID TLV
                           are to be sent.
        sendIdChassisManage(4) The Chassis ID Length, Chassis ID
                           Subtype, Chassis ID, Management Address
                           Length and Management Address fields are
                           all to be sent.
        sendIdDefer(5)     The contents of the Sender ID TLV are
                           determined by the corresponding
                           Maintenance Domain variable
                           (dot1agCfmMaCompIdPermission).
       "             %"802.1ag clauses 18.3, 12.14.3.1.3:c"""Integer identifying the Maintenance Domain Level (MD Level).
        Higher numbers correspond to higher Maintenance Domains,
        those with the greatest physical reach, with the highest
        values for customers' CFM packets.  Lower numbers correspond
        to lower Maintenance Domains, those with more limited
        physical reach, with the lowest values for CFM PDUs
        protecting single bridges or physical links.

        The value (-1) is reserved to indicate that no MA Level has
        been assigned.
       "             <"802.1ag clause 12.14.4.1.3:b and clauses 22.2.3 and 22.2.4""While making the MIP creation evaluation described in 802.1ag
        clause 22.2.3, the management entity can encounter errors in
        the configuration. These are possible errors that can be
        encountered:

        CFMleak(0)   MA x is associated with a specific VID list,
                     one or more of the VIDs in MA x can pass through
                     the Bridge Port, no Down MEP is configured on
                     any Bridge Port for MA x, and some other MA y,
                     at a higher MD Level than MA x, and associated
                     with at least one of the VID(s) also in MA x,
                     does have a MEP configured on the Bridge Port.

        conflictingVids(1)  MA x is associated with a specific VID
                     list, an Up MEP is configured on MA x on the
                     Bridge Port, and some other MA y, associated
                     with at least one of the VID(s) also in MA x,
                     also has an Up MEP configured on some Bridge
                     Port.

        ExcessiveLevels(2)  The number of different MD Levels at
                     which MIPs are to be created on this port
                     exceeds the Bridge's capabilities (see
                     subclause 22.3).

        OverlappedLevels(3) A MEP is created for one VID at one MD
                     Level, but a MEP is configured on another
                     VID at that MD Level or higher, exceeding
                     the Bridge's capabilities.
       "             "802.1ag clause 19.2.1"�"Maintenance association End Point Identifier (MEPID): A small
        integer, unique over a given Maintenance Association,
        identifying a specific MEP.

        The special value 0 is allowed to indicate special cases, for
        example that no MEPID is configured.

        Whenever an object is defined with this SYNTAX, then the
        DESCRIPTION clause of such an object MUST specify what the
        special value of 0 means.
       "             "802.1ag clauses 12.14.6.3.2:c"G"Indicates the direction in which the Maintenance
        association (MEP or MIP) faces on the bridge port:

        down(1)    Sends Continuity Check Messages away from the
                   MAC Relay Entity.
        up(2)      Sends Continuity Check Messages towards the
                   MAC Relay Entity.
       "             ."802.1ag clauses 21.6.5.4, 21.6.5.5, 21.6.5.6"�"Denotes a generic Maintenance Association Name. It is the
        part of the Maintenance Association Identifier which is
        unique within the Maintenance Domain Name and is appended
        to the Maintenance Domain Name to form the Maintenance
        Association Identifier (MAID).

        A Dot1agCfmMaintAssocName value is always interpreted within
        the context of a Dot1agCfmMaintAssocNameType value.  Every
        usage of the Dot1agCfmMaintAssocName textual convention is
        required to specify the Dot1agCfmMaintAssocNameType object
        that provides the context.  It is suggested that the
        Dot1agCfmMaintAssocNameType object be logically registered
        before the object(s) that use the Dot1agCfmMaintAssocName
        textual convention, if they appear in the same logical row.

        The value of a Dot1agCfmMaintAssocName object must
        always be consistent with the value of the associated
        Dot1agCfmMaintAssocNameType object. Attempts to set
        an Dot1agCfmMaintAssocName object to a value inconsistent
        with the associated Dot1agCfmMaintAssocNameType must fail
        with an inconsistentValue error.

        When this textual convention is used as the syntax of an
        index object, there may be issues with the limit of 128
        sub-identifiers specified in SMIv2, IETF STD 58.  In this
        case, the object definition MUST include a 'SIZE' clause
        to limit the number of potential instance sub-identifiers;
        otherwise the applicable constraints MUST be stated in
        the appropriate conceptual row DESCRIPTION clauses, or
        in the surrounding documentation if there is no single
        DESCRIPTION clause that is appropriate.
       "             W"802.1ag clauses 12.14.7.5.3:g, 20.36.2.6, 21.9.8.1, and
        Table 21-30
       " 7"Possible values returned in the ingress action field."             4"802.1ag clauses 12.14.6.1.3:e, 20.8.1 and 21.6.1.3"�"Indicates the interval at which CCMs are sent by a MEP.
        The possible values are:
        intervalInvalid(0) No CCMs are sent (disabled).
        interval300Hz(1)   CCMs are sent every 3 1/3 milliseconds
                           (300Hz).
        interval10ms(2)    CCMs are sent every 10 milliseconds.
        interval100ms(3)   CCMs are sent every 100 milliseconds.
        interval1s(4)      CCMs are sent every 1 second.
        interval10s(5)     CCMs are sent every 10 seconds.
        interval1min(6)    CCMs are sent every minute.
        interval10min(7)   CCMs are sent every 10 minutes.

        Note: enumerations start at zero to match the 'CCM Interval
              field' protocol field.
       "             2"802.1ag clause 12.14.7.6.3:g, 20.19.4 and 21.5.5"�"An enumerated value from the Interface Status TLV from the
        last CCM received from the last MEP. It indicates the status
        of the Interface within which the MEP transmitting the CCM
        is configured, or the next lower Interface in the Interface
        Stack, if the MEP is not configured within an Interface.

        isNoInterfaceStatusTLV(0)  Indicates either that no CCM has been
                              received or that no interface status TLV
                              was present in the last CCM received.

        isUp(1)               The interface is ready to pass packets.

        isDown(2)             The interface cannot pass packets

        isTesting(3)          The interface is in some test mode.

        isUnknown(4)          The interface status cannot be determined
        for some reason.

        isDormant(5)          The interface is not in a state to pass
                              packets but is in a pending state, waiting
                              for some external event.

        isNotPresent(6)       Some component of the interface is missing

        isLowerLayerDown(7)   The interface is down due to state of the
                              lower layer interfaces

        NOTE: A 0 value is used for isNoInterfaceStatusTLV, so that
              these code points can be kept consistent with new code
              points added to ifOperStatus in the IF-MIB.

       "             2"802.1ag clause 20.1.2, 12.14.7.7.2:c and 20.33.9""An enumerated value, equal to the contents of the variable
        highestDefect (20.33.9 and Table 20-1), indicating the
        highest-priority defect that has been present since the MEP
        Fault Notification Generator State Machine was last in the
        FNG_RESET state, either:

        none(0)           no defects since FNG_RESET
        defRDICCM(1)      DefRDICCM
        defMACstatus(2)   DefMACstatus
        defRemoteCCM(3)   DefRemoteCCM
        defErrorCCM(4)    DefErrorCCM
        defXconCCM(5)     DefXconCCM

        The value 0 is used for no defects so that additional higher
        priority values can be added, if needed, at a later time, and
        so that these values correspond with those in
        Dot1agCfmLowestAlarmPri.
       "             "802.1ag clause 17.5"�"A Provider Backbone Bridge (PBB) can comprise a number of
        components, each of which can be managed in a manner
        essentially equivalent to an 802.1Q bridge.  In order to access
        these components easily, an index is used in a number of
        tables.  If any two tables are indexed by
        Dot1agCfmPbbComponentIdentifier, then entries in those tables
        indexed by the same value of Dot1agCfmPbbComponentIdentifier
        correspond to the same component.
       "             i"802.1ag clauses 12.14.7.1.3:o, 12.14.7.1.3:p, 12.14.7.1.3:q,
        12.14.7.1.3:r, and 12.14.7.1.3:s."�"A MEP can detect and report a number of defects, and multiple
        defects can be present at the same time. These defects are:

        bDefRDICCM(0) A remote MEP is reported the RDI bit in its
                     last CCM.
        bDefMACstatus(1) Either some remote MEP is reporting its
                     Interface Status TLV as not isUp, or all remote
                     MEPs are reporting a Port Status TLV that
                     contains some value other than psUp.
        bDefRemoteCCM(2) The MEP is not receiving valid CCMs from at
                     least one of the remote MEPs.
        bDefErrorCCM(3) The MEP has received at least one invalid CCM
                     whose CCM Interval has not yet timed out.
        bDefXconCCM(4) The MEP has received at least one CCM from
                     either another MAID or a lower MD Level whose
                     CCM Interval has not yet timed out.
       "             )"802.1ag clause 12.14.5.1.3:c and 22.2.3"
"Indicates if the Management Entity can create MHFs.
        The valid values are:

        defMHFnone(1)      No MHFs can be created for this VID.
        defMHFdefault(2)   MHFs can be created on this VID on any
                           Bridge port through which this VID can
                           pass.
        defMHFexplicit(3)  MHFs can be created for this VID only on
                           Bridge ports through which this VID can
                           pass, and only if a MEP is created at some
                           lower MD Level.
        defMHFdefer(4)     The creation of MHFs is determined by the
                           corresponding Maintenance Domain variable
                           (dot1agCfmMaCompMhfCreation).
       "             "802.1ag clauses 18.3, 21.4.1"�"Integer identifying the Maintenance Domain Level (MD Level).
        Higher numbers correspond to higher Maintenance Domains,
        those with the greatest physical reach, with the highest
        values for customers' CFM PDUs.  Lower numbers correspond
        to lower Maintenance Domains, those with more limited
        physical reach, with the lowest values for CFM PDUs
        protecting single bridges or physical links.
       "                                                                                                                                                             @"Connectivity Fault Management module for managing IEEE 802.1ag""WG-URL:   http://grouper.ieee.org/groups/802/1/index.html
        WG-EMail: stds-802-1@ieee.org

        Contact:  David Elie-Dit-Cosaque

                  Alcatel-Lucent
                  3400 W. Plano Pkwy.
                  Plano, TX 75075, USA

        E-mail:   david.elie_dit_cosaque@alcatel-lucent.com

        Contact:  Norman Finn

                  Cisco Systems
                  170 W. Tasman Drive
                  San Jose, CA 95134, USA

        E-mail:   nfinn@cisco.com
       " "200706100000Z" I"Included in IEEE P802.1ag Draft 8.1

        Copyright (C) IEEE802.1."       -- 06/10/2007 00:00GMT
          �"A MEP has a persistent defect condition. A notification
        (fault alarm) is sent to the management entity with the OID
        of the MEP that has detected the fault.

        Whenever a MEP has a persistent defect,
        it may or may not generate a Fault Alarm to warn the system
        administrator of the problem, as controlled by the MEP
        Fault Notification Generator State Machine and associated
        Managed Objects. Only the highest-priority defect, as shown
        in Table 20-1, is reported in the Fault Alarm.

        If a defect with a higher priority is raised after a Fault
        Alarm has been issued, another Fault Alarm is issued.

        The management entity receiving the notification can identify
        the system from the network source address of the
        notification, and can identify the MEP reporting the defect
        by the indices in the OID of the dot1agCfmMepHighestPrDefect
        variable in the notification:

           dot1agCfmMdIndex - Also the index of the MEP's
                              Maintenance Domain table entry
                              (dot1agCfmMdTable).
           dot1agCfmMaIndex - Also an index (with the MD table index)
                              of the MEP's Maintenance Association
                              network table entry
                              (dot1agCfmMaNetTable), and (with the MD
                              table index and component ID) of the
                              MEP's MA component table entry
                              (dot1agCfmMaCompTable).
           dot1agCfmMepIdentifier - MEP Identifier and final index
                              into the MEP table (dot1agCfmMepTable).
       " "802.1ag clause 12.14.7.7"                       �"There is one CFM Stack table per bridge. It permits
        the retrieval of information about the Maintenance Points
        configured on any given interface.
       " "802.1ag clauses 12.14.2"                     "The Stack table entry"                      9"This object represents the  Bridge Port or aggregated port
        on which MEPs or MHFs might be configured.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this variable, and  rearrange the
        dot1agCfmStackTable, so that it indexes the entry in the
        interface table with the same value of ifAlias that it
        indexed before the system restart.  If no such entry exists,
        then the system SHALL delete all entries in the
        dot1agCfmStackTable with the interface index.
       " "802.1ag clause 12.14.2.1.2:a"                     5"VLAN ID to which the MP is attached, or 0, if none." '"802.1ag clauses 12.14.2.1.2:d, 22.1.7"                     $"MD Level of the Maintenance Point." "802.1ag clause 12.14.2.1.2:b"                     4"Direction in which the MP faces on the Bridge Port" "802.1ag clause 12.14.2.1.2:c"                     t"The index of the Maintenance Domain in the dot1agCfmMdTable
        to which the MP is associated, or 0, if none." "802.1ag clause 12.14.2.1.3:b"                     �"The index of the MA in the dot1agCfmMaNetTable and
        dot1agCfmMaCompTable to which the MP is associated, or 0, if
        none." "802.1ag clause 12.14.2.1.3:c"                     ,"If an MEP is configured, the MEPID, else 0" "802.1ag clause 12.14.2.1.3:d"                     "MAC address of the MP." "802.1ag clause 12.14.2.1.3:e"                        {"A value indicating the MD Level at which MHFs are to be
        created, and Sender ID TLV transmission by those MHFs is to
        be controlled, for each dot1agCfmDefaultMdEntry whose
        dot1agCfmDefaultMdLevel object contains the value -1.

        After this initialization, this object needs to be persistent
        upon reboot or restart of a device.
       " -"802.1ag clause 12.14.3.1.3:c, 12.14.3.2.2:b"                    �"A value indicating if the Management entity can create MHFs
        (MIP Half Function) for the VID, for each
        dot1agCfmDefaultMdEntry whose dot1agCfmDefaultMdMhfCreation
        object contains the value defMHFdefer.  Since, in this
        variable, there is no encompassing Maintenance Domain, the
        value defMHFdefer is not allowed.

        After this initialization, this object needs to be persistent
        upon reboot or restart of a device.
       " "802.1ag clause 12.14.3.1.3:d"                    ."Enumerated value indicating what, if anything, is to be
        included in the Sender ID TLV (21.5.3) transmitted by MHFs
        created by the Default Maintenance Domain, for each
        dot1agCfmDefaultMdEntry whose dot1agCfmDefaultMdIdPermission
        object contains the value sendIdDefer.  Since, in this
        variable, there is no encompassing Maintenance Domain, the
        value sendIdDefer is not allowed.

        After this initialization, this object needs to be persistent
        upon reboot or restart of a device.
       " "802.1ag clause 12.14.3.1.3:e"                    �"For each bridge component, the Default MD Level Managed Object
        controls MHF creation for VIDs that are not attached to a
        specific Maintenance Association Managed Object, and Sender ID
        TLV transmission by those MHFs.

        For each Bridge Port, and for each VLAN ID whose data can
        pass through that Bridge Port, an entry in this table is
        used by the algorithm in subclause 22.2.3 only if there is no
        entry in the Maintenance Association table defining an MA
        for the same VLAN ID and MD Level as this table's entry, and
        on which MA an Up MEP is defined.  If there exists such an
        MA, that MA's objects are used by the algorithm in
        subclause 22.2.3 in place of this table entry's objects.  The
        agent maintains the value of dot1agCfmDefaultMdStatus to
        indicate whether this entry is overridden by an MA.

        When first initialized, the agent creates this table
        automatically with entries for all VLAN IDs,
        with the default values specified for each object.

        After this initialization, the writable objects in this
        table need to be persistent upon reboot or restart of a
        device.
       " "802.1ag clause 12.14.3"                     #"The Default MD Level table entry."                      "The bridge component within the system to which the information
        in this dot1agCfmDefaultMdEntry applies.  If the system is not
        a Bridge, or if only one component is present in the Bridge,
        then this variable (index) must be equal to 1.
       " "802.1ag clause 17.5"                     K"The Primary VID of the VLAN to which this entry's objects
        apply."                      "State of this Default MD Level table entry.  True if there is
        no entry in the Maintenance Association table defining an MA
        for the same VLAN ID and MD Level as this table's entry, and
        on which MA an Up MEP is defined, else false.
       " "802.1ag clause 12.14.3.1.3:b"                    g"A value indicating the MD Level at which MHFs are to be
        created, and Sender ID TLV transmission by those MHFs is to
        be controlled, for the VLAN to which this entry's objects
        apply.  If this object has the value -1, the MD Level for MHF
        creation for this VLAN is controlled by
        dot1agCfmDefaultMdDefLevel.
       " -"802.1ag clause 12.14.3.1.3:c, 12.14.3.2.2:b"                    "A value indicating if the Management entity can create MHFs
        (MIP Half Function) for this VID at this MD Level.  If this
        object has the value defMHFdefer, MHF creation for this VLAN
        is controlled by dot1agCfmDefaultMdDefMhfCreation.

        The value of this variable is meaningless if the values of
        dot1agCfmDefaultMdStatus is false.
       " "802.1ag clause 12.14.3.1.3:d"                    �"Enumerated value indicating what, if anything, is to be
        included in the Sender ID TLV (21.5.3) transmitted by MHFs
        created by the Default Maintenance Domain.  If this object
        has the value sendIdDefer, Sender ID TLV transmission for
        this VLAN is controlled by dot1agCfmDefaultMdDefIdPermission.

        The value of this variable is meaningless if the values of
        dot1agCfmDefaultMdStatus is false.
       " "802.1ag clause 12.14.3.1.3:e"                        �"This table defines the association of VIDs into VLANs.  There
        is an entry in this table, for each component of the bridge,
        for each VID that is:
            a) a VID belonging to a VLAN associated with more than
               one VID; and
            b) not the Primary VLAN of that VID.
        The entry in this table contains the Primary VID of the VLAN.

        By default, this table is empty, meaning that every VID is
        the Primary VID of a single-VID VLAN.

        VLANs that are associated with only one VID SHOULD NOT have
        an entry in this table.

        The writable objects in this table need to be persistent
        upon reboot or restart of a device.
       " ^"802.1ag clauses 12.14.3.1.3:a, 12.14.3.2.2:a, 12.14.5.3.2:c,
        12.14.6.1.3:b, 22.1.5."                     "The VLAN table entry."                      "The bridge component within the system to which the information
        in this dot1agCfmVlanEntry applies.  If the system is not a
        Bridge, or if only one component is present in the Bridge, then
        this variable (index) must be equal to 1.
       " "802.1ag clause 17.5"                     �"This is a VLAN ID belonging to a VLAN that is associated with
        more than one VLAN ID, and this is not the Primary VID of the
        VLAN.
       "                       �"This is the Primary VLAN ID of the VLAN with which this
        entry's dot1agCfmVlanVid is associated.  This value must not
        equal the value of dot1agCfmVlanVid.
       "                       �"The status of the row.

        The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row
        can be activated.
       "                           �"The CFM Configuration Error List table provides a list of
        Interfaces and VIDs that are incorrectly configured.
       " "802.1ag clause 12.14.4"                     $"The Config Error List Table  entry"                       3"The VLAN ID of the VLAN with interfaces in error." "802.1ag Clause 12.14.4.1.2:a"                    �"This object is the IfIndex of the interface.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this variable so that it indexes the
        entry in the interface table with the same value of ifAlias
        that it indexed before the system restart.  If no such
        entry exists, then the system SHALL delete any entries in
        dot1agCfmConfigErrorListTable indexed by that
        InterfaceIndex value.
       " "802.1ag clause 12.14.4.1.2:b"                     �"A vector of Boolean error conditions from 22.2.4, any of
        which may be true:

        0) CFMleak;
        1) ConflictingVids;
        2) ExcessiveLevels;
        3) OverlappedLevels.
       " "802.1ag clause 12.14.4.1.3:b"                         �"This object contains an unused value for dot1agCfmMdIndex in
        the dot1agCfmMdTable, or a zero to indicate that none exist.
       "                      �"The Maintenance Domain table. Each row in the table
        represents a different Maintenance Domain.

        A Maintenance Domain is described in 802.1ag (3.21) as the
        network or the part of the network for which faults in
        connectivity are to be managed. The boundary of a Maintenance
        Domain is defined by a set of DSAPs, each of which can become
        a point of connectivity to a service instance.
       " "802.1ag clauses 3.21 and 18.1"                     ~"The Maintenance Domain table entry. This entry is not lost
        upon reboot. It is backed up by stable storage.
       "                      "The index to the Maintenance Domain table.

        dot1agCfmMdTableNextIndex needs to be inspected to find an
        available index for row-creation.

        Referential integrity is required, i.e., the index needs to be
        persistent upon a reboot or restart of a device.  The index
        can never be reused for other Maintenance Domain.  The index
        value should keep increasing up to the time that they wrap
        around. This is to facilitate access control based on OID.
       "                       ?"The type (and thereby format) of the Maintenance Domain Name." "802.1ag clause 21.6.5.1"                    y"The Maintenance Domain name. The type/format of this object
        is determined by the value of the dot1agCfmMdNameType object.

        Each Maintenance Domain has unique name amongst all those
        used or available to a service provider or operator.  It
        facilitates easy identification of administrative
        responsibility for each Maintenance Domain.

        Clause 3.23 defines a Maintenance Domain name as the
        identifier, unique over the domain for which CFM is to
        protect against accidental concatenation of Service
        Instances, of a particular Maintenance Domain.
       " -"802.1ag clauses 3.23, 12.14.5, and 21.6.5.3"                     "The Maintenance Domain Level." "802.1ag clause 12.14.5.1.3:b"                    "Enumerated value indicating whether the management entity can
        create MHFs (MIP Half Function) for this Maintenance Domain.
        Since, in this variable, there is no encompassing Maintenance
        Domain, the value defMHFdefer is not allowed.
       " "802.1ag clause 12.14.5.1.3:c"                    4"Enumerated value indicating what, if anything, is to be
        included in the Sender ID TLV (21.5.3) transmitted by MPs
        configured in this Maintenance Domain.  Since, in this
        variable, there is no encompassing Maintenance Domain, the
        value sendIdDefer is not allowed.
       " "802.1ag clause 12.14.5.1.3:d"                     �"Value to be used as the index of the MA table entries, both
        the dot1agCfmMaNetTable and the dot1agCfmMaCompTable, for
        this Maintenance Domain when the management entity wants to
        create a new row in those tables.
       "                       �"The status of the row.

        The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row
        can be activated.
       "                          �"The Maintenance Association table.  Each row in the table
        represents an MA.  An MA is a set of MEPs, each configured
        with a single service instance.

        This is the part of the complete MA table that is constant
        across all Bridges in a Maintenance Domain, and across all
        components of a single Bridge.  That part of the MA table that
        can vary from Bridge component to Bridge component is contained
        in the dot1agCfmMaCompTable.

        Creation of a Service Instance establishes a connectionless
        association among the selected DSAPs.  Configuring a
        Maintenance association End Point (MEP) at each of the
        DSAPs creates a Maintenance Association (MA) to monitor
        that connectionless connectivity.  The MA is identified by a
        Short MA Name that is unique within the Maintenance Domain
        and chosen to facilitate easy identification of the Service
        Instance.  Together, the Maintenance Domain Name and the
        Short MA Name form the Maintenance Association Identifier
        (MAID) that is carried in CFM Messages to identify
        incorrect connectivity among Service Instances.  A small
        integer, the Maintenance association End Point Identifier
        (MEPID), identifies each MEP among those configured on a
        single MA (802.1ag clauses 3.16 and 18.2).

        This table uses two indices, first index is the index of the
        Maintenance Domain table.  The second index is the same as the
        index of the dot1agCfmMaCompEntry for the same MA.

        The writable objects in this table need to be persistent
        upon reboot or restart of a device.

       " "802.1ag clause 18.2"                     "The MA table entry."                       �"Index of the MA table dot1agCfmMdMaNextIndex needs to
        be inspected to find an available index for row-creation.
       "                       V"The type (and thereby format) of the Maintenance Association
        Name.
       " "802.1ag clauses 21.6.5.4"                     �"The Short Maintenance Association name. The type/format of
        this object is determined by the value of the
        dot1agCfmMaNetNameType object.  This name must be unique within
        a maintenance domain.
       " +"802.1ag clauses 21.6.5.6, and Table 21-20"                     X"Interval between CCM transmissions to be used by all MEPs
        in the MA.
       " "802.1ag clause 12.14.6.1.3:e"                     �"The status of the row.

        The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row
        can be activated.
       "                      "The Maintenance Association table.  Each row in the table
        represents an MA.  An MA is a set of MEPs, each configured
        with a single service instance.

        This is the part of the complete MA table that is variable
        across the Bridges in a Maintenance Domain, or across the
        components of a single Bridge.  That part of the MA table that
        is constant across the Bridges and their components in a
        Maintenance Domain is contained in the dot1agCfmMaNetTable.

        This table uses three indices, first index is the
        Dot1agCfmPbbComponentIdentifier that identifies the component
        within the Bridge for which the information in the
        dot1agCfmMaCompEntry applies.  The second is the index of the
        Maintenance Domain table.  The third index is the same as the
        index of the dot1agCfmMaNetEntry for the same MA.

        The writable objects in this table need to be persistent
        upon reboot or restart of a device.

       " "802.1ag clause 18.2"                     "The MA table entry."                      "The bridge component within the system to which the information
        in this dot1agCfmMaCompEntry applies.  If the system is not a
        Bridge, or if only one component is present in the Bridge, then
        this variable (index) must be equal to 1.
       " "802.1ag clause 17.5"                     �"The Primary VLAN ID with which the Maintenance Association is
        associated, or 0 if the MA is not attached to any VID.  If
        the MA is associated with more than one VID, the
        dot1agCfmVlanTable lists them." "802.1ag clause 12.14.6.1.3:b"                     g"Indicates if the Management entity can create MHFs (MIP Half
        Function) for this MA.
       " "802.1ag clause 12.14.6.1.3:c"                     �"Enumerated value indicating what, if anything, is to be
        included in the Sender ID TLV (21.5.3) transmitted by MPs
        configured in this MA.
       " "802.1ag clause 12.14.6.1.3:d"                     5"The number of VIDs associated with the MA.
       " "802.1ag clause 12.14.6.1.3:b"                     �"The status of the row.

        The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row
        can be activated.
       "                      n"List of MEPIDs that belong to this MA.

        Clause 12.14.6.1.3 specifies that a list of MEPIDs in all
        bridges in that MA, but since SNMP SMI does not allow to
        state in a MIB that an object in a table is an array, the
        information has to be stored in another table with two
        indices, being the first index, the index of the table that
        contains the list or array.

        For all bridges in which the same MAID {dot1agCfmMdFormat,
        dot1agCfmMdName, dot1agCfmMaNetFormat, and dot1agCfmMaNetName}
        is configured, the same set of dot1agCfmMaMepListIdentifiers
        must be configured in the bridges' dot1agCfmMaMepListTables.
        This allows each MEP to determine whether or not it is
        receiving CCMs from all of the other MEPs in the MA.

        For example, if one were creating a new MA whose MAID were
        {charString, 'Dom1', charString, 'MA1'}, that had 2 MEPs, whose
        MEPIDs were 1 and 3, one could, in Bridge A:
         1. Get a new MD index d from dot1agCfmMdTableNextIndex.
         2. Create the Maintenance Domain {charString, 'Dom1'}.
         3. Get a new MA index a from dot1agCfmMdMaNextIndex [d].
         4. Create the Maintenance Association {charString, 'MA1'}.
         5. Create a new dot1agCfmMaMepListEntry for each of the MEPs
            in the MA: [d, a, 1] and [d, a, 3].
         6. Create one of the new MEPs, say [d, a, 1].
        Then, in Bridge B:
         7. Do all of these steps 1-6, except for using the other MEPID
            for the new MEP in Step 6, in this example, MEPID 3.
        Note that, when creating the MA, MEP List Table, and MEP
        entries in the second bridge, the indices 'd' and 'a'
        identifying the MAID {charString, 'Dom1', charString, 'MA1'}
        may have different values than those in the first Bridge.
       " "802.1ag clause 12.14.6.1.3:g"                     "The known MEPS table entry."                       "MEPID" "802.1ag clause 12.14.6.1.3:g"                     �"The status of the row. Read SNMPv2-TC (RFC1903) for an
        explanation of the possible values this object can take.
       "                          �"The Maintenance Association End Point (MEP) table.

        Each row in the table represents a different MEP.  A MEP is
        an actively managed CFM entity, associated with a specific
        DSAP of a Service Instance, which can generate and receive
        CFM PDUs and track any responses.  It is an end point of a
        single Maintenance Association, and is an endpoint of a
        separate Maintenance Entity for each of the other MEPs in
        the same Maintenance Association (802.1ag clause 3.17).

        This table uses three indices. The first two indices are the
        indices of the Maintenance Domain and MA tables, the reason
        being that a MEP is always related to an MA and Maintenance
        Domain.

        The MEP table also stores all the managed objects for sending
        LBM and LTM.

        *LBM Managed objects

        LBM Managed objects in the MEP table
        enables the management entity to initiate
        transmission of Loopback messages.  It will signal the MEP
        that it should transmit some number of Loopback messages
        and detect the detection (or lack thereof) of the
        corresponding Loopback messages.

        Steps to use entries in this table:

        1) Wait for dot1agCfmMepTransmitLbmStatus value to be
           true.  To do this do this sequence:
           a. an SNMP GET for both SnmpSetSerialNo and
              dot1agCfmMepTransmitLbmStatus objects (in same SNMP
              PDU).
           b. Check if value for dot1agCfmMepTransmitLbmStatus is true.
              - if not, wait x seconds, go to step a above.
              - if yes, save the value of SnmpSetSerialNo and go
                to step 2) below
        2) Change dot1agCfmMepTransmitLbmStatus value from true to
           false to ensure no other management entity will use
           the service. In order to not disturb a possible other NMS
           do this by sending an SNMP SET for both SnmpSetSerialNo
           and dot1agCfmMepTransmitLbmStatus objects (in same SNMP
           PDU,  and make sure SNmpSetSerialNo is the first varBind).
           For the SnmpSetSerialNo varBind, use the value that you
           obtained in step 1)a.. This ensures that two cooperating
           NMSes will not step on each others toes.
        3) Setup the different data to be sent (number of messages,
           optional TLVs,...), except do not set
           dot1agCfmMepTransmitLbmMessages.
        4) Record the current values of dot1agCfmMepLbrIn,
           dot1agCfmMepLbrInOutOfOrder, and dot1agCfmMepLbrBadMsdu.
        6) Set dot1agCfmMepTransmitLbmMessages to a non-zero value to
           initiate transmission of Loopback messages.
        7) Check the value of dot1agCfmMepTransmitLbmResultOK to
           find out if the operation was successfully initiated or
           not.
        8) Monitor the value of dot1agCfmMepTransmitLbmMessages.
           When it reaches 0, the last LBM has been transmitted.
           Wait an additional 5 seconds to ensure that all LBRs have
           been returned.
        9) Compare dot1agCfmMepLbrIn, dot1agCfmMepLbrInOutOfOrder,
           and dot1agCfmMepLbrBadMsdu to their old values from step
           4, above, to get the results of the test.
       10) Change the dot1agCfmMepTransmitLbmStatus value back to
           true to allow other management entities to use the table.

        *LTM Managed objects
        The LTM Managed objects in the MEP table are used in a manner
        similar to that described for LBM transmission, above, except
        transmission is initiated by writing a value to the
        dot1agCfmMepTransmitLtmFlags object.  Upon
        successfully initiating the transmission, the variables
        dot1agCfmMepTransmitLtmSeqNumber and
        dot1agCfmMepTransmitLtmEgressIdentifier return the information
        required to recover the results of the LTM from the
        dot1agCfmLtrTable.
       " ""802.1ag clauses 12.14.7 and 19.2"                     "The MEP table entry"                      )"Integer that is unique among all the MEPs in the same MA.
        Other definition is: a small integer, unique over a given
        Maintenance Association, identifying a specific Maintenance
        association End Point (3.18).

        MEP Identifier is also known as the MEPID.
       " ("802.1ag clauses 3.18, 19.2 and 12.14.7"                    "This object is the interface index of the interface either a
        bridge port, or an aggregated IEEE 802.1 link within a bridge
        port, to which the MEP is attached.

        Upon a restart of the system, the system SHALL, if necessary,
        change the value of this variable so that it indexes the
        entry in the interface table with the same value of ifAlias
        that it indexed before the system restart.  If no such
        entry exists, then the system SHALL set this variable to 0.
       " "802.1ag clause 12.14.7.1.3:b"                     :"The direction in which the MEP faces on the Bridge port." ("802.1ag clauses 12.14.7.1.3:c and 19.2"                     �"An integer indicating the Primary VID of the MEP, always
        one of the VIDs assigned to the MEP's MA.  The value 0
        indicates that either the Primary VID is that of the
        MEP's MA, or that the MEP's MA is associated with no VID." "802.1ag clauses 12.14.7.1.3:d"                     �"Administrative state of the MEP

        A Boolean indicating the administrative state of the MEP.

        True indicates that the MEP is to function normally, and
        false that it is to cease functioning." *"802.1ag clauses 12.14.7.1.3:e and 20.9.1"                     X"Current state of the MEP Fault Notification Generator
        State Machine.
       " )"802.1ag clauses 12.14.7.1.3:f and 20.35"                     5"If set to true, the MEP will generate CCM messages." +"802.1ag clauses 12.14.7.1.3:g and 20.10.1"                    �"The priority value for CCMs and LTMs transmitted by the MEP.
        Default Value is the highest priority value allowed to pass
        through the bridge port for any of this MEPs VIDs.
        The management entity can obtain the default value for this
        variable from the priority regeneration table by extracting the
        highest priority value in this table on this MEPs bridge port.
        (1 is lowest, then 2, then 0, then 3-7).
       " "802.1ag clause 12.14.7.1.3:h"                     "MAC address of the MEP." '"802.1ag clause 12.14.7.1.3:i and 19.4"                     s"An integer value specifying the lowest priority defect
        that is allowed to generate fault alarm.
       " 8"802.1ag clause 12.14.7.1.3:k and 20.9.5 and Table 20-1"                     �"The time that defects must be present before a Fault Alarm is
        issued (fngAlarmTime. 20.33.3) (default 2.5s).
       " +"802.1ag clauses 12.14.7.1.3:l and 20.33.3"                     ~"The time that defects must be absent before resetting a
        Fault Alarm (fngResetTime, 20.33.4) (default 10s).
       " +"802.1ag clauses 12.14.7.1.3:m and 20.33.4"                     �"The highest priority defect that has been present since the
        MEPs Fault Notification Generator State Machine was last in
        the FNG_RESET state.
       " 6"802.1ag clause 12.14.7.1.3:n  20.33.9 and Table 21-1"                     �"A vector of Boolean error conditions from Table 20-1, any of
        which may be true:

        DefRDICCM(0)
        DefMACstatus(1)
        DefRemoteCCM(2)
        DefErrorCCM(3)
        DefXconCCM(4)
       " �".1ag clauses 12.14.7.1.3:o, 12.14.7.1.3:p, 12.14.7.1.3:q,
        12.14.7.1.3:r, 12.14.7.1.3:s, 20.21.3, 20.23.3, 20.33.5,
        20.33.6, 20.33.7."                     <"The last-received CCM that triggered an DefErrorCCM fault." +"802.1ag clauses 12.14.7.1.3:t and 20.21.2"                     :"The last-received CCM that triggered a DefXconCCM fault." +"802.1ag clauses 12.14.7.1.3:u and 20.23.2"                     ["The total number of out-of-sequence CCMs received from all
        remote MEPs.
       " ,"802.1ag clauses 12.14.7.1.3:v and 20.16.12"                     8"Total number of Continuity Check messages transmitted." +"802.1ag clauses 12.14.7.1.3:w and 20.10.2"                     �"Next sequence number/transaction identifier to be sent in a
        Loopback message. This sequence number can be zero because
        it wraps around.
       " +"802.1ag clauses 12.14.7.1.3:x and 20.28.2"                     <"Total number of valid, in-order Loopback Replies received." *"802.1ag clause 12.14.7.1.3:y and 20.31.1"                     V"The total number of valid, out-of-order Loopback Replies
        received.
       " *"802.1ag clause 12.14.7.1.3:z and 20.31.1"                     �"The total number of LBRs received whose
        mac_service_data_unit did not match (except for the OpCode)
        that of the corresponding LBM (20.2.3).
       " '"802.1ag clause 12.14.7.1.3:aa  20.2.3"                     �"Next transaction identifier/sequence number to be sent in a
        Linktrace message. This sequence number can be zero because
        it wraps around.
       " +"802.1ag clause 12.14.7.1.3:ab and 20.36.1"                     B"The total number of unexpected LTRs received (20.39.1).
       " ("802.1ag clause 12.14.7.1.3:ac  20.39.1"                     /"Total number of Loopback Replies transmitted." +"802.1ag clause 12.14.7.1.3:ad and 20.26.2"                     i"A Boolean flag set to true by the bridge port to indicate
        that another LBM may be transmitted."                       �"The Target MAC Address Field to be transmitted: A unicast
        destination MAC address.
        This address will be used if the value of the column
        dot1agCfmMepTransmitLbmDestIsMepId is 'false'.
       " "802.1ag clause 12.14.7.3.2:b"                    "The Maintenance association End Point Identifier of another
        MEP in the same Maintenance Association to which the LBM is
        to be sent.
        This address will be used if the value of the column
        dot1agCfmMepTransmitLbmDestIsMepId is 'true'.
       " "802.1ag clause 12.14.7.3.2:b"                     �"True indicates that MEPID of the target MEP is used for
        Loopback transmission.
        False indicates that unicast destination MAC address of the
        target MEP is used for Loopback transmission.
       " "802.1ag clause 12.14.7.3.2:b"                     4"The number of Loopback messages to be transmitted." "802.1ag clause 12.14.7.3.2:c"                     w"An arbitrary amount of data to be included in the Data TLV,
        if the Data TLV is selected to be sent.
       " "802.1ag clause 12.14.7.3.2:d"                     �"Priority. 3 bit value to be used in the VLAN tag, if present
        in the transmitted frame.

        The default value is CCM priority.
       " "802.1ag clause 12.14.7.3.2:e"                     �"Drop Enable bit value to be used in the VLAN tag, if present
        in the transmitted frame.

        For more information about VLAN Drop Enable, please check
        IEEE 802.1ad.
       " "802.1ag clause 12.14.7.3.2:e"                     �"Indicates the result of the operation:

        - true       The Loopback Message(s) will be
                     (or has been) sent.
        - false      The Loopback Message(s) will not
                     be sent.
       " "802.1ag clause 12.14.7.3.3:a"                     �"The Loopback Transaction Identifier
       (dot1agCfmMepNextLbmTransId) of the first LBM (to be) sent.
        The value returned is undefined if
        dot1agCfmMepTransmitLbmResultOK is false.
       " "802.1ag clause 12.14.7.3.3:a"                     �"A Boolean flag set to true by the bridge port to indicate
        that another LTM may be transmitted.
        Reset to false by the MEP Linktrace Initiator State Machine."                       2"The flags field for LTMs transmitted by the MEP." *"802.1ag clause 12.14.7.4.2:b and 20.37.1"                     �"The Target MAC Address Field to be transmitted: A unicast
        destination MAC address.
        This address will be used if the value of the column
        dot1agCfmMepTransmitLtmTargetIsMepId is 'false'.
       " "802.1ag clause 12.14.7.4.2:c"                    A"An indication of the Target MAC Address Field to be
        transmitted:
        The Maintenance association End Point Identifier of
        another MEP in the same Maintenance Association
        This address will be used if the value of the column
        dot1agCfmMepTransmitLtmTargetIsMepId is 'true'.
       " "802.1ag clause 12.14.7.4.2:c"                     �"True indicates that MEPID of the target MEP is used for
        Linktrace transmission.
        False indicates that unicast destination MAC address of the
        target MEP is used for Loopback transmission.
       " "802.1ag clause 12.14.7.4.2:c"                    �"The LTM TTL field. Default value, if not specified, is 64.
        The TTL field indicates the number of hops remaining to the
        LTM.  Decremented by 1 by each Linktrace Responder that
        handles the LTM.  The value returned in the LTR is one less
        than that received in the LTM.  If the LTM TTL is 0 or 1, the
        LTM is not forwarded to the next hop, and if 0, no LTR is
        generated.
       " )"802.1ag clause 12.14.7.4.2:d and 21.8.4"                     �"Indicates the result of the operation:

        - true    The Linktrace Message will be (or has been) sent.
        - false   The Linktrace Message will not be sent" "802.1ag clause 12.14.7.4.3:a"                     �"The LTM Transaction Identifier
        (dot1agCfmMepLtmNextSeqNumber) of the LTM sent.
        The value returned is undefined if
        dot1agCfmMepTransmitLtmResult is false.
       " "802.1ag clause 12.14.7.4.3:a"                    �"Identifies the MEP Linktrace Initiator that is originating,
        or the Linktrace Responder that is forwarding, this LTM.
        The low-order six octets contain a 48-bit IEEE MAC address
        unique to the system in which the MEP Linktrace Initiator
        or Linktrace Responder resides.  The high-order two octets
        contain a value sufficient to uniquely identify the MEP
        Linktrace Initiator or Linktrace Responder within that system.

        For most Bridges, the address of any MAC attached to the
        Bridge will suffice for the low-order six octets, and 0 for
        the high-order octets.  In some situations, e.g., if multiple
        virtual Bridges utilizing emulated LANs are implemented in a
        single physical system, the high-order two octets can be used
        to differentiate among the transmitting entities.

        The value returned is undefined if
        dot1agCfmMepTransmitLtmResult is false.
       " )"802.1ag clause 12.14.7.4.3:b and 21.8.8"                     �"The status of the row.

        The writable columns in a row can not be changed if the row
        is active. All columns must have a valid value before a row
        can be activated.
       "                      s"This table extends the MEP table and contains a list of
        Linktrace replies received by a specific MEP in response to
        a linktrace message.

        SNMP SMI does not allow to state in a MIB that an object in
        a table is an array.  The solution is to take the index (or
        indices) of the first table and add one or more indices.
       " "802.1ag clause 12.14.7.5"                     ""The Linktrace Reply table entry."                       �"Transaction identifier/Sequence number returned by a previous
        transmit linktrace message command, indicating which LTM's
        response is going to be returned.
       " "802.1ag clause 12.14.7.5.2:b"                     "An index to distinguish among multiple LTRs with the same LTR
        Transaction Identifier field value.  dot1agCfmLtrReceiveOrder
        are assigned sequentially from 1, in the order that the
        Linktrace Initiator received the LTRs.
       " "802.1ag clause 12.14.7.5.2:c"                     %"TTL field value for a returned LTR." ("802.1ag clause 12.14.7.5 and 20.36.2.2"                     "Indicates if a LTM was forwarded by the responding MP, as
        returned in the 'FwdYes' flag of the flags field.
       " -"802.1ag clauses 12.14.7.5.3:c and 20.36.2.1"                     �"A boolean value stating whether the forwarded LTM reached a
        MEP enclosing its MA, as returned in the Terminal MEP flag of
        the Flags field.
       " -"802.1ag clauses 12.14.7.5.3:d and 20.36.2.1"                    �"An octet field holding the Last Egress Identifier returned
        in the LTR Egress Identifier TLV of the LTR.
        The Last Egress Identifier identifies the MEP Linktrace
        Initiator that originated, or the Linktrace Responder that
        forwarded, the LTM to which this LTR is the response.  This
        is the same value as the Egress Identifier TLV of that LTM.
       " -"802.1ag clauses 12.14.7.5.3:e and 20.36.2.3"                    7"An octet field holding the Next Egress Identifier returned
        in the LTR Egress Identifier TLV of the LTR.  The Next Egress
        Identifier Identifies the Linktrace Responder that
        transmitted this LTR, and can forward the LTM to the next
        hop.  This is the same value as the Egress Identifier TLV of
        the forwarded LTM, if any. If the FwdYes bit of the Flags
        field is false, the contents of this field are undefined,
        i.e., any value can be transmitted, and the field is ignored
        by the receiver.
       " -"802.1ag clauses 12.14.7.5.3:f and 20.36.2.4"                     +"Value returned in the Relay Action field." -"802.1ag clauses 12.14.7.5.3:g and 20.36.2.5"                     �"This object specifies the format of the Chassis ID returned
        in the Sender ID TLV of the LTR, if any.  This value is
        meaningless if the dot1agCfmLtrChassisId has a length of 0." ,"802.1ag clauses 12.14.7.5.3:h and 21.5.3.2"                     �"The Chassis ID returned in the Sender ID TLV of the LTR, if
        any. The format of this object is determined by the
        value of the dot1agCfmLtrChassisIdSubtype object.
       " ,"802.1ag clauses 12.14.7.5.3:i and 21.5.3.3"                    �"The TDomain that identifies the type and format of
        the related dot1agCfmMepDbManAddress object, used to access
        the SNMP agent of the system transmitting the LTR.  Received
        in the LTR Sender ID TLV from that system.

        Typical values will be one of (not all inclusive) list:


           snmpUDPDomain          (from SNMPv2-TM, RFC3417)
           snmpIeee802Domain      (from SNMP-IEEE802-TM-MIB, RFC4789)

        The value 'zeroDotZero' (from RFC2578) indicates 'no management
        address was present in the LTR', in which case the related
        object dot1agCfmMepDbManAddress must have a zero-length OCTET
        STRING as a value.
       " 1"802.1ag clauses 12.14.7.5.3:j, 21.5.3.5, 21.9.6"                    p"The TAddress that can be used to access the SNMP
        agent of the system transmitting the CCM, received in the CCM
        Sender ID TLV from that system.

        If the related object dot1agCfmLtrManAddressDomain contains
        the value 'zeroDotZero', this object dot1agCfmLtrManAddress
        must have a zero-length OCTET STRING as a value.
      " 1"802.1ag clauses 12.14.7.5.3:j, 21.5.3.7, 21.9.6"                     �"The value returned in the Ingress Action Field of the LTM.
        The value ingNoTlv(0) indicates that no Reply Ingress TLV was
        returned in the LTM." -"802.1ag clauses 12.14.7.5.3:k and 20.36.2.6"                     �"MAC address returned in the ingress MAC address field.
        If the dot1agCfmLtrIngress object contains the value
        ingNoTlv(0), then the contents of this object are meaningless." -"802.1ag clauses 12.14.7.5.3:l and 20.36.2.7"                     �"Format of the Ingress Port ID.
        If the dot1agCfmLtrIngress object contains the value
        ingNoTlv(0), then the contents of this object are meaningless." -"802.1ag clauses 12.14.7.5.3:m and 20.36.2.8"                    "Ingress Port ID. The format of this object is determined by
        the value of the dot1agCfmLtrIngressPortIdSubtype object.
        If the dot1agCfmLtrIngress object contains the value
        ingNoTlv(0), then the contents of this object are meaningless." -"802.1ag clauses 12.14.7.5.3:n and 20.36.2.9"                     �"The value returned in the Egress Action Field of the LTM.
        The value egrNoTlv(0) indicates that no Reply Egress TLV was
        returned in the LTM." ."802.1ag clauses 12.14.7.5.3:o and 20.36.2.10"                     �"MAC address returned in the egress MAC address field.
        If the dot1agCfmLtrEgress object contains the value
        egrNoTlv(0), then the contents of this object are meaningless." ."802.1ag clauses 12.14.7.5.3:p and 20.36.2.11"                     �"Format of the egress Port ID.
        If the dot1agCfmLtrEgress object contains the value
        egrNoTlv(0), then the contents of this object are meaningless." ."802.1ag clauses 12.14.7.5.3:q and 20.36.2.12"                    "Egress Port ID. The format of this object is determined by
        the value of the dot1agCfmLtrEgressPortIdSubtype object.
        If the dot1agCfmLtrEgress object contains the value
        egrNoTlv(0), then the contents of this object are meaningless." ."802.1ag clauses 12.14.7.5.3:r and 20.36.2.13"                     �"All Organization specific TLVs returned in the LTR, if
        any.  Includes all octets including and following the TLV
        Length field of each TLV, concatenated together." '"802.1ag clauses 12.14.7.5.3:s, 21.5.2"                    o"The MEP Database. A database, maintained by every MEP, that
        maintains received information about other MEPs in the
        Maintenance Domain.

        The SMI does not allow to state in a MIB that an object in
        a table is an array. The solution is to take the index (or
        indices) of the first table and add one or more indices.
       " "802.1ag clause 19.2.15"                     "The MEP Database table entry."                       �"Maintenance association End Point Identifier of a remote MEP
        whose information from the MEP Database is to be returned.
       " "802.1ag clause 12.14.7.6.2:b"                     ="The operational state of the remote MEP IFF State machines." ("802.1ag clause 12.14.7.6.3:b and 20.22"                     �"The time (SysUpTime) at which the IFF Remote MEP state machine
        last entered either the RMEP_FAILED or RMEP_OK state.
       " "802.1ag clause 12.14.7.6.3:c"                     $"The MAC address of the remote MEP." *"802.1ag clause 12.14.7.6.3:d and 20.19.7"                     w"State of the RDI bit in the last received CCM (true for
        RDI=1), or false if none has been received.
       " +"802.1ag clauses 12.14.7.6.3:e and 20.19.2"                    	"An enumerated value of the Port status TLV received in the
        last CCM from the remote MEP or the default value
        psNoPortStateTLV indicating either no CCM has been received,
        or that nor port status TLV was received in the last CCM.
       " *"802.1ag clause 12.14.7.6.3:f and 20.19.3"                    ""An enumerated value of the Interface status TLV received
        in the last CCM from the remote MEP or the default value
        isNoInterfaceStatus TLV indicating either no CCM has been
        received, or that no interface status TLV was received in
        the last CCM.
       " *"802.1ag clause 12.14.7.6.3:g and 20.19.4"                     W"This object specifies the format of the Chassis ID received
        in the last CCM." ,"802.1ag clauses 12.14.7.6.3:h and 21.5.3.2"                     �"The Chassis ID. The format of this object is determined by the
        value of the dot1agCfmLtrChassisIdSubtype object.
       " ,"802.1ag clauses 12.14.7.6.3:h and 21.5.3.3"                    �"The TDomain that identifies the type and format of
        the related dot1agCfmMepDbManAddress object, used to access
        the SNMP agent of the system transmitting the CCM.  Received
        in the CCM Sender ID TLV from that system.

        Typical values will be one of (not all inclusive) list:


           snmpUDPDomain          (from SNMPv2-TM, RFC3417)
           snmpIeee802Domain      (from SNMP-IEEE802-TM-MIB, RFC4789)

        The value 'zeroDotZero' (from RFC2578) indicates 'no management
        address was present in the LTR', in which case the related
        object dot1agCfmMepDbManAddress must have a zero-length OCTET
        STRING as a value.
       " 1"802.1ag clauses 12.14.7.6.3:h, 21.5.3.5, 21.6.7"                    u"The TAddress that can be used to access the SNMP
        agent of the system transmitting the CCM, received in the CCM
        Sender ID TLV from that system.

        If the related object dot1agCfmMepDbManAddressDomain contains
        the value 'zeroDotZero', this object dot1agCfmMepDbManAddress
        must have a zero-length OCTET STRING as a value.
       " 1"802.1ag clauses 12.14.7.6.3:h, 21.5.3.7, 21.6.7"                             ="The compliance statement for support of the CFM MIB module."    "The VLAN ID group is optional." �"The dot1agCfmMepLbrBadMsdu variable is optional.  It
                 must not be present if the system cannot compare a
                 received LBR to the corresponding LBM." ,"Support for createAndWait is not required." ,"Support for createAndWait is not required." ,"Support for createAndWait is not required." ,"Support for createAndWait is not required." ,"Support for createAndWait is not required." ,"Support for createAndWait is not required."                 "Objects for the Stack group."                 )"Objects for the Default MD Level group."                  "Objects for the VLAN ID group."                 5"Objects for the CFM Configuration Error List Group."                 +"Objects for the Maintenance Domain Group."                 "Objects for the MA group."                 "Objects for the MEP group."                 "Objects for the MEP group."                 &"Objects for the Notifications group."                        