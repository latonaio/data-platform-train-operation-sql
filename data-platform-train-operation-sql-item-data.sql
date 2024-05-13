CREATE TABLE `data_platform_train_operation_item_data`
(
  `RailwayLine`                  int(16) NOT NULL,
  `TrainOperationVersion`        int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `TrainOperationID`             int(4) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `RailwayLineStationID`         int(4) NOT NULL,
  `StopStation`                  int(16) NOT NULL,
  `DepartingTime`                time(16) NOT NULL,
  `ArrivingTime`                 time(16) DEFAULT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `TrainOperationID`, `ExpressType`, `RailwayLineStationID`, `StopStation`),

    CONSTRAINT `DPFMTrainOperationItemData_fk` FOREIGN KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `TrainOperationID`, `ExpressType`) REFERENCES `data_platform_train_operation_header_data` (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `TrainOperationID`, `ExpressType`),
    CONSTRAINT `DPFMTrainOperationItemDataStopStation_fk` FOREIGN KEY (`RailwayLine`, `RailwayLineStationID`, `StopStation`) REFERENCES `data_platform_railway_line_stop_station_data` (`RailwayLine`, `RailwayLineStationID`, `StopStation`),
    CONSTRAINT `DPFMTrainOperationItemDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMTrainOperationItemDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
