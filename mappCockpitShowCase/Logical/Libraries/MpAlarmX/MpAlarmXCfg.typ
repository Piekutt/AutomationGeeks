TYPE
    MpAlarmXCfgEnum :
        (
        mpALARMX_CFG_ALARMS := 140, (*MpAlarmXCfgListType: Root element of the List Configuration*)
        mpALARMX_CFG_HISTORY := 120, (*MpAlarmXCfgHistoryType: Root element of the History Configuration*)
        mpALARMX_CFG_SNIPPET := 142, (*MpAlarmXCfgListSnippetType: Single Alarm Snippet*)
        mpALARMX_CFG_ALARM := 141, (*MpAlarmXCfgListAlarmType: Single alarm configuration*)
        mpALARMX_CFG_QUERY := 181, (*MpAlarmXCfgQueryQueryType: Single Alarm Query*)
        mpALARMX_CFG_CATEGORY := 161, (*MpAlarmXCfgCategoryCategoryType: Single Alarm Category*)
        mpALARMX_CFG_DEFAULTACTION := 102, (*MpAlarmXCfgCoreMappingActionType: Single alarm default action*)
        mpALARMX_CFG_QUERIES := 180, (*MpAlarmXCfgQueryType: Root element of the Query Configuration*)
        mpALARMX_CFG_CATEGORIES := 160, (*MpAlarmXCfgCategoryType: Root element of the Category Configuration*)
        mpALARMX_CFG_MAPPING := 101, (*MpAlarmXCfgCoreMappingIType: Single alarm mapping*)
        mpALARMX_CFG_CORE := 100, (*MpAlarmXCfgCoreType: Root element of the Core Configuration*)
        mpALARMX_CFG_CATEGORYLINK := 104, (*MpAlarmXCfgCoreCategoriesType: Single Alarm Category Link*)
        mpALARMX_CFG_ALARMLINK := 103 (*MpAlarmXCfgCoreListsType: Single Alarm List*)
        );
    MpAlarmXCfgCategorySeverityType : STRUCT (*Defines categories by alarm severity*)
        Severity : STRING[20]; (*Severity range that defines this category (e.g. 2...15 or 20)*)
    END_STRUCT;
    MpAlarmXCfgCategoryCodeType : STRUCT (*Defines categories by alarm code*)
        Code : STRING[20]; (*Code range that defines this category (e.g. 2...15 or 20)*)
    END_STRUCT;
    MpAlarmXCfgCategoryDefinedByEnum :
        ( (*Base property by which the categories are defined*)
        mpALARMX_CFG_CATEGORY_SEVERITY := 0, (*Defines categories by alarm severity*)
        mpALARMX_CFG_CATEGORY_CODE := 1 (*Defines categories by alarm code*)
        );
    MpAlarmXCfgCategoryDefinedByType : STRUCT (*Base property by which the categories are defined*)
        Type : MpAlarmXCfgCategoryDefinedByEnum; (*Definition of Defined by*)
        Severity : MpAlarmXCfgCategorySeverityType; (*Defines categories by alarm severity*)
        Code : MpAlarmXCfgCategoryCodeType; (*Defines categories by alarm code*)
    END_STRUCT;
    MpAlarmXCfgCategoryCategoryType : STRUCT (*Category*)
        Name : STRING[50]; (*Name of the category*)
        DefinedBy : MpAlarmXCfgCategoryDefinedByType; (*Base property by which the categories are defined*)
    END_STRUCT;
    MpAlarmXCfgCategoryAlarmCatType : STRUCT (*Alarm categories*)
        Category : MpBaseCfgArrayType; (*MpAlarmXCfgCategoryCategoryType: Category*)
    END_STRUCT;
    MpAlarmXCfgCategoryType : STRUCT (*Complete MpAlarmXCategory configuration structure.*)
        AlarmCategories : MpAlarmXCfgCategoryAlarmCatType; (*Alarm categories*)
    END_STRUCT;
    MpAlarmXCfgCoreActparamType : STRUCT (*Action Parameter*)
        Name : STRING[100]; (*Name of the reaction*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingActionEnum :
        ( (*Defines the actions associated with a mapping.*)
        mpALARMX_CFG_CORE_NONE := 0, (*Action: None*)
        mpALARMX_CFG_CORE_REACTION := 1, (*Action Parameter*)
        mpALARMX_CFG_CORE_ESCALATE_ALARM := 2, (*Action: Escalate Alarm*)
        mpALARMX_CFG_CORE_ESC_REACTION := 3, (*Action: Escalate Reaction*)
        mpALARMX_CFG_CORE_AGGREGATEESC := 4, (*Action: Aggregate Alarm and Escalate*)
        mpALARMX_CFG_CORE_AGGREGATE := 5, (*Action: Aggregate Alarm locally*)
        mpALARMX_CFG_CORE_REMAIN := 6 (*Action: Remain*)
        );
    MpAlarmXCfgCoreMappingActionType : STRUCT (*Defines the actions associated with a mapping.*)
        Type : MpAlarmXCfgCoreMappingActionEnum; (*Definition of Action*)
        Data : MpAlarmXCfgCoreActparamType; (*Action Parameter*)
    END_STRUCT;
    MpAlarmXCfgCoreTaskClassEnum :
        ( (*The task class this component runs in*)
        mpALARMX_CFG_CORE_TC_CYCLIC_1 := 1, (*Task Class #1*)
        mpALARMX_CFG_CORE_TC_CYCLIC_2 := 2, (*Task Class #2*)
        mpALARMX_CFG_CORE_TC_CYCLIC_3 := 3, (*Task Class #3*)
        mpALARMX_CFG_CORE_TC_CYCLIC_4 := 4, (*Task Class #4*)
        mpALARMX_CFG_CORE_TC_CYCLIC_5 := 5, (*Task Class #5*)
        mpALARMX_CFG_CORE_TC_CYCLIC_6 := 6, (*Task Class #6*)
        mpALARMX_CFG_CORE_TC_CYCLIC_7 := 7, (*Task Class #7*)
        mpALARMX_CFG_CORE_TC_CYCLIC_8 := 8 (*Task Class #8*)
        );
    MpAlarmXCfgCoreGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable component*)
        CyclicTaskClass : MpAlarmXCfgCoreTaskClassEnum; (*Task class in which cyclic operation will take place*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingIType : STRUCT (*Mapping 1-N*)
        Alarm : STRING[100]; (*Filter: AlarmName or [Severity]*)
        Action : MpAlarmXCfgCoreMappingActionType; (*Defined Action*)
    END_STRUCT;
    MpAlarmXCfgCoreMappingType : STRUCT (*Mapping by alarm *)
        Mapping : MpBaseCfgArrayType; (*MpAlarmXCfgCoreMappingIType: Mapping 1-N*)
    END_STRUCT;
    MpAlarmXCfgCoreDefaultType : STRUCT (*Default action of alarm*)
        Action : MpBaseCfgArrayType; (*MpAlarmXCfgCoreMappingActionType: Defined action.*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmMappingType : STRUCT (*Definition of the alarm mapping*)
        Mapping : MpAlarmXCfgCoreMappingType; (*Mapping by alarm *)
        Default : MpAlarmXCfgCoreDefaultType; (*Default action of alarm*)
    END_STRUCT;
    MpAlarmXCfgCoreArgumentsType : STRUCT (*Argument that can be used to replace the according place-holder ({N}) in any string within the linked configuration*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        Arguments : ARRAY[0..8] OF STRING[255];
    END_STRUCT;
    MpAlarmXCfgCoreListsType : STRUCT (*Mapping 1-N*)
        List : STRING[50]; (*Definition of alarm list*)
        CodeOffset : DINT; (*Offset that is added to the alarm-codes used in the attached list*)
        Arguments : MpAlarmXCfgCoreArgumentsType; (*Argument that can be used to replace the according place-holder ({N}) in any string within the linked configuration*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmListsType : STRUCT (*Link to alarm-list(s)*)
        Lists : MpBaseCfgArrayType; (*MpAlarmXCfgCoreListsType: Mapping 1-N*)
    END_STRUCT;
    MpAlarmXCfgCoreEnabledType : STRUCT (*Allow unconfigured alarms*)
        Alarm : STRING[100]; (*Alarm-configuration which is used for non-configured alarms (optional)*)
    END_STRUCT;
    MpAlarmXCfgCoreUncfgAlarmsEnum :
        ( (*Allow setting of not-configured alarms*)
        mpALARMX_CFG_CORE_DISABLED := 0, (*Disallow unconfigured alarms*)
        mpALARMX_CFG_CORE_ENABLED := 1 (*Allow unconfigured alarms*)
        );
    MpAlarmXCfgCoreUncfgAlarmsType : STRUCT (*Allow setting of not-configured alarms*)
        Type : MpAlarmXCfgCoreUncfgAlarmsEnum; (*Definition of Unconfigured alarms*)
        Enabled : MpAlarmXCfgCoreEnabledType; (*Allow unconfigured alarms*)
    END_STRUCT;
    MpAlarmXCfgCoreDataType : STRUCT (*UserROM + DRAM*)
        Size : UDINT; (*Memory reserved for storing the retained alarms*)
        BufferSize : UDINT; (*DRAM buffer size*)
        MaximumSaveInterval : UDINT; (*Defines after which time data is (latest) transferred from DRAM to UserROM*)
    END_STRUCT;
    MpAlarmXCfgCoreMemoryEnum :
        ( (*Location where data will be stored*)
        mpALARMX_CFG_CORE_MEM_DISABLED := 0, (*Disabled*)
        mpALARMX_CFG_CORE_ROM_DRAM := 1, (*UserROM + DRAM*)
        mpALARMX_CFG_CORE_ROM_RAM := 2, (*UserROM + UserRAM*)
        mpALARMX_CFG_CORE_RAM := 3 (*UserRAM*)
        );
    MpAlarmXCfgCoreMemoryType : STRUCT (*Location where data will be stored*)
        Type : MpAlarmXCfgCoreMemoryEnum; (*Definition of Memory*)
        Data : MpAlarmXCfgCoreDataType; (*UserROM + DRAM*)
    END_STRUCT;
    MpAlarmXCfgCoreRetainType : STRUCT (*Configuration for storing retain alarms*)
        Memory : MpAlarmXCfgCoreMemoryType; (*Location where data will be stored*)
    END_STRUCT;
    MpAlarmXCfgCoreCategoriesType : STRUCT (*Alarm categories*)
        List : STRING[50]; (*Definition of alarm category*)
    END_STRUCT;
    MpAlarmXCfgCoreAlarmCatType : STRUCT (*List of alarm categories*)
        Categories : MpBaseCfgArrayType; (*MpAlarmXCfgCoreCategoriesType: Alarm categories*)
    END_STRUCT;
    MpAlarmXCfgCoreType : STRUCT (*Complete MpAlarmXCore configuration structure.*)
        General : MpAlarmXCfgCoreGeneralType; (*General Settings*)
        AlarmMapping : MpAlarmXCfgCoreAlarmMappingType; (*Definition of the alarm mapping*)
        AlarmLists : MpAlarmXCfgCoreAlarmListsType; (*Link to alarm-list(s)*)
        UnconfiguredAlarms : MpAlarmXCfgCoreUncfgAlarmsType; (*Allow setting of not-configured alarms*)
        Retain : MpAlarmXCfgCoreRetainType; (*Configuration for storing retain alarms*)
        AlarmCategories : MpAlarmXCfgCoreAlarmCatType; (*List of alarm categories*)
    END_STRUCT;
    MpAlarmXCfgHistoryGeneralType : STRUCT (*General Settings*)
        Enable : BOOL; (*Enable/Disable of component*)
        EnableAuditing : BOOL; (*Enable/Disable sending of audit-events*)
    END_STRUCT;
    MpAlarmXCfgHistoryExportType : STRUCT (*Export settings.*)
        TimestampPattern : STRING[50]; (*Timestamp pattern in the alarm history export. This format can be changed.*)
        AutoFileExtension : BOOL; (*Automatically adds a file extension if not specified in the file name*)
        ColumnSeparator : STRING[1]; (*Delimiter used to separate columns in the CSV file*)
    END_STRUCT;
    MpAlarmXCfgHistoryDataType : STRUCT (*Memory Parameter*)
        Size : UDINT; (*Memory reserved for storing the history*)
        BufferSize : UDINT; (*DRAM buffer size*)
        MaximumSaveInterval : UDINT; (*Defines after which time data is (latest) transferred from DRAM to UserROM*)
    END_STRUCT;
    MpAlarmXCfgHistoryMemoryEnum :
        ( (*Location where data will be stored*)
        mpALARMX_CFG_HISTORY_ROM_DRAM := 0, (*Memory Parameter*)
        mpALARMX_CFG_HISTORY_ROM_RAM := 1, (*UserROM + UserRAM*)
        mpALARMX_CFG_HISTORY_RAM := 2 (*UserRAM*)
        );
    MpAlarmXCfgHistoryMemoryType : STRUCT (*Location where data will be stored*)
        Type : MpAlarmXCfgHistoryMemoryEnum; (*Definition of Memory*)
        Data : MpAlarmXCfgHistoryDataType; (*Memory Parameter*)
    END_STRUCT;
    MpAlarmXCfgHistoryScopeEnum :
        ( (*Definition of scope*)
        mpALARMX_CFG_HISTORY_COMPONENT := 0, (*Includes only alarms on the same level*)
        mpALARMX_CFG_HISTORY_BRANCH := 1 (*Include all alarms within the same component branch*)
        );
    MpAlarmXCfgHistoryHistoryType : STRUCT (*Alarm history settings.*)
        Export : MpAlarmXCfgHistoryExportType; (*Export settings.*)
        Memory : MpAlarmXCfgHistoryMemoryType; (*Location where data will be stored*)
        Scope : MpAlarmXCfgHistoryScopeEnum; (*Definition of scope*)
    END_STRUCT;
    MpAlarmXCfgHistoryType : STRUCT (*Complete MpAlarmXHistory configuration structure.*)
        General : MpAlarmXCfgHistoryGeneralType; (*General Settings*)
        AlarmHistory : MpAlarmXCfgHistoryHistoryType; (*Alarm history settings.*)
    END_STRUCT;
    MpAlarmXCfgListStaticType : STRUCT (*Static*)
        Limit : LREAL; (*Limit as static numeric input*)
        LimitText : STRING[100]; (*Contents of snippet {&LimitText} to be integrated in the alarm message. A raw text or text ID can be entered, e.g. "LowLow" or {$MyText}.*)
        Delay : REAL; (*Delay time before triggering the alarm*)
        Hysteresis : LREAL; (*Hysteresis window for triggering the alarm*)
        TimeConstant : REAL; (*Time constant of the first-order derivative action element (DT1)*)
    END_STRUCT;
    MpAlarmXCfgListDynamicType : STRUCT (*Dynamic*)
        LimitPv : STRING[255]; (*Process variable that contains the limit*)
        LimitText : STRING[100]; (*Contents of snippet {&LimitText} to be integrated in the alarm message. A raw text or text ID can be entered, e.g. "LowLow" or {$MyText}.*)
        DelayPv : STRING[255]; (*Process variable that contains the delay time*)
        HysteresisPv : STRING[255]; (*Process variable that contains the hysteresis value*)
        TimeConstantPv : STRING[255]; (*Process variable that contains the time-constant value*)
    END_STRUCT;
    MpAlarmXCfgListLimitSelectorEnum :
        ( (*Defines the limits.*)
        mpALARMX_CFG_LIST_LIMIT_DISABLED := 0, (*Disabled*)
        mpALARMX_CFG_LIST_LIMIT_STATIC := 1, (*Static*)
        mpALARMX_CFG_LIST_LIMIT_DYNAMIC := 2 (*Dynamic*)
        );
    MpAlarmXCfgListLimitSelectorType : STRUCT (*Defines the limits.*)
        Type : MpAlarmXCfgListLimitSelectorEnum; (*Definition of Limit Selector*)
        LimitStatic : MpAlarmXCfgListStaticType; (*Static*)
        LimitDynamic : MpAlarmXCfgListDynamicType; (*Dynamic*)
    END_STRUCT;
    MpAlarmXCfgListLimitSeleRateEnum :
        ( (*Defines the limits.*)
        mpALARMX_CFG_LIST_RATE_DISABLED := 0, (*Disabled*)
        mpALARMX_CFG_LIST_RATE_STATIC := 1, (*Static*)
        mpALARMX_CFG_LIST_RATE_DYNAMIC := 2 (*Dynamic*)
        );
    MpAlarmXCfgListLimitSeleRateType : STRUCT (*Defines the limits.*)
        Type : MpAlarmXCfgListLimitSeleRateEnum; (*Definition of Limit Selector Rate*)
        RateStatic : MpAlarmXCfgListStaticType; (*Static*)
        RateDynamic : MpAlarmXCfgListDynamicType; (*Dynamic*)
    END_STRUCT;
    MpAlarmXCfgListAckValueListEnum :
        ( (*Acknowledge Requirements*)
        mpALARMX_CFG_LIST_ACK_DISABLED := 0, (*No acknowledge required. Inactive and acknowledged alarms disappear from the current alarm list automatically.*)
        mpALARMX_CFG_LIST_ACK_REQ := 1, (*The alarm must be acknowledged. This can be done at any time.*)
        mpALARMX_CFG_LIST_ACK_REQ_AND_RE := 3 (*The alarm must be acknowledged. This can be done at any time. The acknowledgment state is reset when the alarm is re-enabled.*)
        );
    MpAlarmXCfgListConfValueListEnum :
        ( (*Confirm Requirements*)
        mpALARMX_CFG_LIST_CFM_DISABLED := 0, (*No confirm required. Inactive alarms disappear from the current alarm list automatically.*)
        mpALARMX_CFG_LIST_CFM_REQUIRED := 1, (*The alarm must be confirmed. This can be done once the alarm is acknowledged.*)
        mpALARMX_CFG_LIST_CFM_REQ_AFT_RE := 2, (*The alarm must be confirmed. But this can only be done once the alarm is reset and acknowledged.*)
        mpALARMX_CFG_LIST_CFM_REQ_AND_RE := 3 (*The alarm must be confirmed. But this can only be done once the alarm is reset and acknoweldged. When the alarm-state changed to active again also the confirm-state is reset.*)
        );
    MpAlarmXCfgListRecordingType : STRUCT (*Defines which changes should be recorded*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        ActiveToInactive : BOOL; (*"Active" to "Inactive" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
        Update : BOOL; (*Re-activates the alarm (set while active without a state change)*)
    END_STRUCT;
    MpAlarmXCfgListSettingsEnum :
        ( (*Defines the limits.*)
        mpALARMX_CFG_LIST_STATIC := 0, (*Static Limits*)
        mpALARMX_CFG_LIST_DYNAMIC := 1 (*Dynamic Limits*)
        );
    MpAlarmXCfgListSettingsType : STRUCT (*Defines the limits.*)
        Type : MpAlarmXCfgListSettingsEnum; (*Definition of Settings*)
        Static : MpAlarmXCfgListStaticType; (*Static Limits*)
        Dynamic : MpAlarmXCfgListDynamicType; (*Dynamic Limits*)
    END_STRUCT;
    MpAlarmXCfgListActivationType : STRUCT (*Updates values during (re-)activation*)
        Timestamp : BOOL; (*Updates the timestamp when the alarm is re-activated*)
        Snippets : BOOL; (*Updates the snippet when the alarm is re-activated*)
    END_STRUCT;
    MpAlarmXCfgListDataUpdateType : STRUCT (*Defines which values should be updated when an alarm is re-activated.*)
        Activation : MpAlarmXCfgListActivationType; (*Updates values during (re-)activation*)
    END_STRUCT;
    MpAlarmXCfgListRecedgeType : STRUCT (*Defines which state changes should be recorded in the history report*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
    END_STRUCT;
    MpAlarmXCfgListEdgeAlarmType : STRUCT (*Behaviour: Edge Alarm*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behavior.*)
        MultipleInstances : BOOL; (*Permits multiple instances*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListRecedgeType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListRecpersType : STRUCT (*Defines which state changes should be recorded in the history report*)
        InactiveToActive : BOOL; (*"Inactive" to "Active" state changes should be recorded.*)
        ActiveToInactive : BOOL; (*"Active" to "Inactive" state changes should be recorded.*)
        UnacknowledgedToAcknowledged : BOOL; (*"Unacknowledged" to "Acknowledged" state changes should be recorded.*)
        AcknowledgedToUnacknowledged : BOOL; (*"Acknowledged" to "Unacknowledged" state changes should be recorded.*)
        UnconfirmedToConfirmed : BOOL; (*"Unconfirmed" to "Confirmed" state changes should be recorded.*)
        ConfirmedToUnconfirmed : BOOL; (*"Confirmed" to "Unconfirmed" state changes should be recorded.*)
        Update : BOOL; (*Re-activates the alarm (set while active without a state change)*)
    END_STRUCT;
    MpAlarmXCfgListPersAlarmType : STRUCT (*Behaviour: Persistent Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        MultipleInstances : BOOL; (*Permits multiple instances of this alarm*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListRecpersType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListUserDefinedType : STRUCT (*Behaviour: Custom Alarm*)
        AutoReset : BOOL; (*Immediately resets this alarm after it is set (not necessary to call MpAlarmXReset)*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        MultipleInstances : BOOL; (*Permits multiple instances of this alarm*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        Retain : BOOL; (*Retains the state of the alarm after the PLC is restarted*)
        Asynchronous : BOOL; (*Alarm is set asynchronously in the context of MpAlarmXCore*)
        DataUpdate : MpAlarmXCfgListDataUpdateType; (*Update definitions*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
    END_STRUCT;
    MpAlarmXCfgListLevelmonType : STRUCT (*Defines monitoring parameters (limits, hysteresis, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low limit*)
        LowlowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSelectorType; (*Configured the high limit*)
        HighhighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListSettingsType; (*Internal monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListLevelMonitorType : STRUCT (*Behaviour: Level Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListLevelmonType; (*Defines monitoring parameters (limits, hysteresis, delay)*)
    END_STRUCT;
    MpAlarmXCfgListMonitoringType : STRUCT (*Monitoring parameters (limits, hysteresis, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        SetpointPv : STRING[255]; (*Process variable that contains the setpoint for monitoring*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low limit*)
        LowlowLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high limit*)
        HighhighLimit : MpAlarmXCfgListLimitSelectorType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListSettingsType; (*Internal monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListDeviatMonitorType : STRUCT (*Behaviour: Deviation Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListMonitoringType; (*Monitoring parameters (limits, hysteresis, delay)*)
    END_STRUCT;
    MpAlarmXCfgListRocmonType : STRUCT (*Defines monitoring parameters (limits, filter, delay)*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        Exclusive : BOOL; (*Exclusive (only one state can be active) or non-exclusive (two states can be active simultaneously)*)
        LowLimit : MpAlarmXCfgListLimitSeleRateType; (*Configures the low limit*)
        LowlowLimit : MpAlarmXCfgListLimitSeleRateType; (*Configures the low low limit*)
        HighLimit : MpAlarmXCfgListLimitSeleRateType; (*Configures the high limit*)
        HighhighLimit : MpAlarmXCfgListLimitSeleRateType; (*Configures the high high limit*)
        Settings : MpAlarmXCfgListSettingsType; (*Internal rate-of-change monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListRocMonitorType : STRUCT (*Behaviour: Rate of Change Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListRocmonType; (*Defines monitoring parameters (limits, filter, delay)*)
    END_STRUCT;
    MpAlarmXCfgListTrgvalueType : STRUCT (*Value or range of values that should trigger the alarm*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        AlarmTriggerValueI : ARRAY[0..3] OF STRING[50];
    END_STRUCT;
    MpAlarmXCfgListTrgvaluesType : STRUCT (*Defines the trigger values*)
        AlarmTriggerValueI : MpAlarmXCfgListTrgvalueType; (*Value or range of values that should trigger the alarm*)
    END_STRUCT;
    MpAlarmXCfgListDiscMonType : STRUCT (*Defines monitoring settings*)
        MonitoredPv : STRING[255]; (*Process variable that should be monitored*)
        TriggerValues : MpAlarmXCfgListTrgvaluesType; (*Defines the trigger values*)
        Settings : MpAlarmXCfgListSettingsType; (*Internal discrete value monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListDiscreteMonType : STRUCT (*Behaviour: Discreet Value Monitoring Alarm*)
        Acknowledge : MpAlarmXCfgListAckValueListEnum; (*Acknowledge behavior.*)
        Confirm : MpAlarmXCfgListConfValueListEnum; (*Confirm behevior.*)
        ReactionWhilePending : BOOL; (*If TRUE, a reaction caused by the alarm will remain active until the alarm is no longer pending (reset, acknowledged and confirmed). Otherwise, it will remain active until the alarm is reset.*)
        HistoryReport : MpAlarmXCfgListRecordingType; (*Defines which state changes should be recorded in the history report*)
        Monitoring : MpAlarmXCfgListDiscMonType; (*Defines monitoring settings*)
    END_STRUCT;
    MpAlarmXCfgListBehaviorEnum :
        ( (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        mpALARMX_CFG_LIST_EDGE := 0, (*Behaviour: Edge Alarm*)
        mpALARMX_CFG_LIST_PERSISTENT := 1, (*Behaviour: Persistent Alarm*)
        mpALARMX_CFG_LIST_USER_DEFINED := 2, (*Behaviour: Custom Alarm*)
        mpALARMX_CFG_LIST_LEVEL_MONITOR := 3, (*Behaviour: Level Monitoring Alarm*)
        mpALARMX_CFG_LIST_DEVIAT_MONITOR := 4, (*Behaviour: Deviation Monitoring Alarm*)
        mpALARMX_CFG_LIST_ROC_MONITOR := 5, (*Behaviour: Rate of Change Monitoring Alarm*)
        mpALARMX_CFG_LIST_DISCRETE_MON := 6 (*Behaviour: Discreet Value Monitoring Alarm*)
        );
    MpAlarmXCfgListBehaviorType : STRUCT (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        Type : MpAlarmXCfgListBehaviorEnum; (*Definition of Behavior*)
        Edge : MpAlarmXCfgListEdgeAlarmType; (*Behaviour: Edge Alarm*)
        Persistent : MpAlarmXCfgListPersAlarmType; (*Behaviour: Persistent Alarm*)
        UserDefined : MpAlarmXCfgListUserDefinedType; (*Behaviour: Custom Alarm*)
        LevelMonitor : MpAlarmXCfgListLevelMonitorType; (*Behaviour: Level Monitoring Alarm*)
        DeviatMonitor : MpAlarmXCfgListDeviatMonitorType; (*Behaviour: Deviation Monitoring Alarm*)
        RocMonitor : MpAlarmXCfgListRocMonitorType; (*Behaviour: Rate of Change Monitoring Alarm*)
        DiscreteMon : MpAlarmXCfgListDiscreteMonType; (*Behaviour: Discreet Value Monitoring Alarm*)
    END_STRUCT;
    MpAlarmXCfgListAlarmType : STRUCT (*Alarm 1-N*)
        Name : STRING[100]; (*Unique identifier for this alarm in the current context (alarm core, mapp component)*)
        Message : STRING[255]; (*Description text that the operator sees on the screen. This can include format items and text system references.*)
        Code : UDINT; (*Numeric alarm code*)
        Severity : UDINT; (*Indicates the urgency of an alarm (often referred to as "priority")*)
        Behavior : MpAlarmXCfgListBehaviorType; (*Pattern for the behavior options (open the advanced view for details, e.g. auto-reset, auto-acknowledge, recording options)*)
        Disable : BOOL; (*Permanently disables this alarm*)
        InhibitPv : STRING[255]; (*Boolean process variable for dynamically disable monitoring*)
        AdditionalInformation1 : STRING[255]; (*Can be used to display a cause/solution page or instructional video, for example (text can include format items and text system references)*)
        AdditionalInformation2 : STRING[255]; (*Can be used to display a cause/solution page or instructional video, for example (text can include format items and text system references)*)
    END_STRUCT;
    MpAlarmXCfgListAlarmListType : STRUCT (*List of user defined alarms*)
        Alarm : MpBaseCfgArrayType; (*MpAlarmXCfgListAlarmType: Alarm 1-N*)
    END_STRUCT;
    MpAlarmXCfgListEnabledType : STRUCT (*Auto-Detect: Enabled*)
        Language : STRING[20]; (*Language to use for auto-detect*)
    END_STRUCT;
    MpAlarmXCfgListAutoDetectEnum :
        ( (*Automatically detects used snippets based on the alarm message*)
        mpALARMX_CFG_LIST_DISABLED := 0, (*Auto-Detect: Disabled*)
        mpALARMX_CFG_LIST_ENABLED := 1 (*Auto-Detect: Enabled*)
        );
    MpAlarmXCfgListAutoDetectType : STRUCT (*Automatically detects used snippets based on the alarm message*)
        Type : MpAlarmXCfgListAutoDetectEnum; (*Definition of Auto detect*)
        Enabled : MpAlarmXCfgListEnabledType; (*Auto-Detect: Enabled*)
    END_STRUCT;
    MpAlarmXCfgListSnippetPvType : STRUCT (*The snippet value comes from a Process Variable*)
        ProcessVariable : STRING[255]; (*Variable from which data should be added to the alarm text*)
    END_STRUCT;
    MpAlarmXCfgListValueEnum :
        ( (*Data source for the snippet data*)
        mpALARMX_CFG_LIST_SNIPPET_PV := 0 (*The snippet value comes from a Process Variable*)
        );
    MpAlarmXCfgListValueType : STRUCT (*Data source for the snippet data*)
        Type : MpAlarmXCfgListValueEnum; (*Definition of Value*)
        SnippetPv : MpAlarmXCfgListSnippetPvType; (*The snippet value comes from a Process Variable*)
    END_STRUCT;
    MpAlarmXCfgListSnippetType : STRUCT (*Alarm text snippet.*)
        Key : STRING[100]; (*Unique key of an alarm text snippet. This can be used to add application data to the alarm text (text system or alarm message).*)
        Value : MpAlarmXCfgListValueType; (*Data source for the snippet data*)
        Alarm : STRING[100]; (*Alarm name (pattern) of the session to which this snippet is attached (optional)*)
    END_STRUCT;
    MpAlarmXCfgListTextSnippetsType : STRUCT (*List of alarm text snippets*)
        AutoDetect : MpAlarmXCfgListAutoDetectType; (*Automatically detects used snippets based on the alarm message*)
        Snippet : MpBaseCfgArrayType; (*MpAlarmXCfgListSnippetType: Alarm text snippet.*)
    END_STRUCT;
    MpAlarmXCfgListType : STRUCT (*Complete MpAlarmXList configuration structure.*)
        AlarmList : MpAlarmXCfgListAlarmListType; (*List of user defined alarms*)
        TextSnippets : MpAlarmXCfgListTextSnippetsType; (*List of alarm text snippets*)
    END_STRUCT;
    MpAlarmXCfgQueryColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_INSTANCEID := 2, (*Instance ID column*)
        mpALARMX_CFG_QUERY_CODE := 3, (*Code column*)
        mpALARMX_CFG_QUERY_SEVERITY := 4, (*Severity column*)
        mpALARMX_CFG_QUERY_SCOPE := 5, (*Scope column*)
        mpALARMX_CFG_QUERY_STATECHANGE := 6, (*State change column*)
        mpALARMX_CFG_QUERY_TIMESTAMP := 7, (*Timestamp column*)
        mpALARMX_CFG_QUERY_ADDINFO1 := 8, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_ADDINFO2 := 9 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryOperatorsEnum :
        ( (*Available operators for query conditions*)
        mpALARMX_CFG_QUERY_LT := 0, (*Less Than*)
        mpALARMX_CFG_QUERY_LE := 0, (*Less Than or Equal*)
        mpALARMX_CFG_QUERY_GT := 0, (*Greater Than*)
        mpALARMX_CFG_QUERY_GE := 0, (*Greater Than or Equal*)
        mpALARMX_CFG_QUERY_EQ := 0, (*Equal*)
        mpALARMX_CFG_QUERY_NE := 0, (*Not Equal*)
        mpALARMX_CFG_QUERY_LIKE := 0 (*Like*)
        );
    MpAlarmXCfgQueryPendColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_PEND_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_PEND_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_PEND_INST_ID := 2, (*Instance ID column*)
        mpALARMX_CFG_QUERY_PEND_CODE := 3, (*Code column*)
        mpALARMX_CFG_QUERY_PEND_SEVERITY := 4, (*Severity column*)
        mpALARMX_CFG_QUERY_PEND_SCOPE := 5, (*Scope column*)
        mpALARMX_CFG_QUERY_PEND_STATEACT := 6, (*State active column*)
        mpALARMX_CFG_QUERY_PEND_STATEACK := 7, (*State acknowledged column*)
        mpALARMX_CFG_QUERY_PEND_STATECMF := 8, (*State confirmed column*)
        mpALARMX_CFG_QUERY_PEND_TIME := 9, (*Timestamp column*)
        mpALARMX_CFG_QUERY_PEND_TIME_ACK := 10, (*Timestamp acknowledge column*)
        mpALARMX_CFG_QUERY_PEND_ADDINFO1 := 11, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_PEND_ADDINFO2 := 12 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryConfColumnsEnum :
        ( (*Available columns for the queries*)
        mpALARMX_CFG_QUERY_CONF_NAME := 0, (*Name column*)
        mpALARMX_CFG_QUERY_CONF_MESSAGE := 1, (*Message column*)
        mpALARMX_CFG_QUERY_CONF_CODE := 2, (*Code column*)
        mpALARMX_CFG_QUERY_CONF_SEVERITY := 3, (*Severity column*)
        mpALARMX_CFG_QUERY_CONF_ADDINFO1 := 4, (*Additional information 1 column*)
        mpALARMX_CFG_QUERY_CONF_ADDINFO2 := 5 (*Additional information 2 column*)
        );
    MpAlarmXCfgQueryUpdateModeEnum :
        ( (*Defines when to update*)
        mpALARMX_CFG_QUERY_ON_CHANGE := 0, (*On every change*)
        mpALARMX_CFG_QUERY_ON_NEWREMOVED := 1 (*On new/removed alarms only*)
        );
    MpAlarmXCfgQueryPendColItemType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryPendColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryPendColType : STRUCT (*The columns to select with this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        Columns : ARRAY[0..14] OF MpAlarmXCfgQueryPendColItemType;
    END_STRUCT;
    MpAlarmXCfgQuerySelectpType : STRUCT (*SELECT values to copy*)
        Columns : MpAlarmXCfgQueryPendColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryValueType : STRUCT (*Compares against a defined value*)
        Value : STRING[255]; (**)
    END_STRUCT;
    MpAlarmXCfgQueryCompareToEnum :
        ( (*Type of comparison*)
        mpALARMX_CFG_QUERY_VALUE := 0, (*Compares against a defined value*)
        mpALARMX_CFG_QUERY_PV := 1 (*Compares against the value of a specified process variable*)
        );
    MpAlarmXCfgQueryCompareToType : STRUCT (*Type of comparison*)
        Type : MpAlarmXCfgQueryCompareToEnum; (*Definition of Compare To*)
        Value : MpAlarmXCfgQueryValueType; (*Compares against a defined value*)
    END_STRUCT;
    MpAlarmXCfgQueryPendCondItemType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryPendColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryPendCondType : STRUCT (*The filters to apply for this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryPendCondItemType;
    END_STRUCT;
    MpAlarmXCfgQueryWherepType : STRUCT (*Filter to be applied*)
        Connect : STRING[255]; (*Filter by logical operator*)
        WhereFilter : MpAlarmXCfgQueryPendCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryPendingType : STRUCT (*Permits the query to return data from the current list of pending alarms*)
        Component : STRING[50]; (*The MpLink of the core component*)
        Select : MpAlarmXCfgQuerySelectpType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryWherepType; (*Filter to be applied*)
    END_STRUCT;
    MpAlarmXCfgQueryConfColItemType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryConfColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryConfColType : STRUCT (*The columns to select with this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        Columns : ARRAY[0..9] OF MpAlarmXCfgQueryConfColItemType;
    END_STRUCT;
    MpAlarmXCfgQuerySelectcType : STRUCT (*SELECT values to copy*)
        Columns : MpAlarmXCfgQueryConfColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryConfCondItemType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryConfColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryConfCondType : STRUCT (*The filters to apply for this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryConfCondItemType;
    END_STRUCT;
    MpAlarmXCfgQueryWherecType : STRUCT (*Filter to be applied.*)
        Connect : STRING[255]; (*Filter by logical operator*)
        WhereFilter : MpAlarmXCfgQueryConfCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryConfiguredType : STRUCT (*Data of all configured alarms returned by the query*)
        Component : STRING[50]; (*The MpLink of the core component*)
        Select : MpAlarmXCfgQuerySelectcType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryWherecType; (*Filter to be applied.*)
    END_STRUCT;
    MpAlarmXCfgQueryHistColItemType : STRUCT (*The columns to select with this query*)
        Column : MpAlarmXCfgQueryColumnsEnum; (*Name of a column to copy to a PV*)
        ProcessVariable : STRING[255]; (*Name of the PV to which the value is copied (use [] instead of [0] for arrays)*)
    END_STRUCT;
    MpAlarmXCfgQueryHistColType : STRUCT (*The columns to select with this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        Columns : ARRAY[0..14] OF MpAlarmXCfgQueryHistColItemType;
    END_STRUCT;
    MpAlarmXCfgQuerySelectqType : STRUCT (*SELECT values to copy*)
        Columns : MpAlarmXCfgQueryHistColType; (*The columns to select with this query*)
    END_STRUCT;
    MpAlarmXCfgQueryHistCondItemType : STRUCT (*The filters to apply for this query*)
        Column : MpAlarmXCfgQueryColumnsEnum; (*Column to filter*)
        Operator : MpAlarmXCfgQueryOperatorsEnum; (*Comparison operator for filtering*)
        CompareTo : MpAlarmXCfgQueryCompareToType; (*Type of comparison*)
    END_STRUCT;
    MpAlarmXCfgQueryHistCondType : STRUCT (*The filters to apply for this query*)
        NumberOfElements : UDINT; (*Defines the number of used elements inside the array.*)
        WhereFilter : ARRAY[0..4] OF MpAlarmXCfgQueryHistCondItemType;
    END_STRUCT;
    MpAlarmXCfgQueryWhereqType : STRUCT (*Filter to be applied*)
        Connect : STRING[255]; (*Filter by logical operator*)
        WhereFilter : MpAlarmXCfgQueryHistCondType; (*The filters to apply for this query*)
    END_STRUCT;
    MpAlarmXCfgQueryHistoricalType : STRUCT (*Permits the query to return data from the current list of stored alarms*)
        Component : STRING[50]; (*The MpLink of the history component*)
        Select : MpAlarmXCfgQuerySelectqType; (*SELECT values to copy*)
        Where : MpAlarmXCfgQueryWhereqType; (*Filter to be applied*)
    END_STRUCT;
    MpAlarmXCfgQuerySourceEnum :
        ( (*Data source that is queried*)
        mpALARMX_CFG_QUERY_PENDING := 0, (*Permits the query to return data from the current list of pending alarms*)
        mpALARMX_CFG_QUERY_CONFIGURED := 1, (*Data of all configured alarms returned by the query*)
        mpALARMX_CFG_QUERY_HISTORICAL := 2 (*Permits the query to return data from the current list of stored alarms*)
        );
    MpAlarmXCfgQuerySourceType : STRUCT (*Data source that is queried*)
        Type : MpAlarmXCfgQuerySourceEnum; (*Definition of Query source*)
        Pending : MpAlarmXCfgQueryPendingType; (*Permits the query to return data from the current list of pending alarms*)
        Configured : MpAlarmXCfgQueryConfiguredType; (*Data of all configured alarms returned by the query*)
        Historical : MpAlarmXCfgQueryHistoricalType; (*Permits the query to return data from the current list of stored alarms*)
    END_STRUCT;
    MpAlarmXCfgQueryQueryType : STRUCT (*User-defined queries*)
        Name : STRING[100]; (*Unique name for the query*)
        UpdateCount : STRING[255]; (*PV to which the update count for the query is written (increased whenever new data is available)*)
        UpdateMode : MpAlarmXCfgQueryUpdateModeEnum; (*Definition of update mode*)
        QuerySource : MpAlarmXCfgQuerySourceType; (*Data source that is queried*)
    END_STRUCT;
    MpAlarmXCfgQueryDataQueriesType : STRUCT (*List of queries*)
        Query : MpBaseCfgArrayType; (*MpAlarmXCfgQueryQueryType: User-defined queries*)
    END_STRUCT;
    MpAlarmXCfgQueryType : STRUCT (*Complete MpAlarmXQuery configuration structure.*)
        DataQueries : MpAlarmXCfgQueryDataQueriesType; (*List of queries*)
    END_STRUCT;
END_TYPE
