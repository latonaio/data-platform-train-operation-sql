CREATE TABLE `data_platform_train_operation_header_data`
(
  `RailwayLine`                  int(16) NOT NULL,
  `OperationDate`                date NOT NULL,
  `TrainOperationID`             int(4) NOT NULL,
  `WeekdayType`                  varchar(6) NOT NULL,
  `ExpressType`                  varchar(4) NOT NULL,
  `TrainOperationVersion`        int(4) DEFAULT NULL,
  `PlannedTrainOperationID`      int(4) DEFAULT NULL,
  `DepartureStation`             int(16) NOT NULL,
  `DestinationStation`           int(16) NOT NULL,
  `PlannedDepartureTime`         time NOT NULL,
  `PlannedArrivalTime`           time NOT NULL,
  `ActualDepartureTime`          time NOT NULL,
  `ActualArrivalTime`            time NOT NULL,
  `Description`                  varchar(60) NOT NULL,
  `OperationRemarks`             varchar(100) DEFAULT NULL,
  `OperationCode`                varchar(40) DEFAULT NULL,
  `ValidityStartDate`            date NOT NULL,
  `ValidityEndDate`              date NOT NULL,
  `CreationDate`                 date NOT NULL,
  `CreationTime`                 time NOT NULL,
  `LastChangeDate`               date NOT NULL,
  `LastChangeTime`               time NOT NULL,
  `CreateUser`                   int(12) NOT NULL,
  `LastChangeUser`               int(12) NOT NULL,
  `IsReleased`                   tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`          tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`RailwayLine`, `OperationDate`, `TrainOperationID`),

    CONSTRAINT `DPFMTrainOperationHeaderData_fk` FOREIGN KEY (`RailwayLine`) REFERENCES `data_platform_railway_line_header_data` (`RailwayLine`),
    CONSTRAINT `DPFMTrainOperationHeaderDataWeekdayType_fk` FOREIGN KEY (`WeekdayType`) REFERENCES `data_platform_weekday_type_express_type_data` (`WeekdayType`),
    CONSTRAINT `DPFMTrainOperationHeaderDataExpressType_fk` FOREIGN KEY (`RailwayLine`, `ExpressType`) REFERENCES `data_platform_railway_line_express_type_data` (`RailwayLine`, `ExpressType`),
    CONSTRAINT `DPFMTrainOperationHeaderDataPlannedID_fk` FOREIGN KEY (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`) REFERENCES `data_platform_planned_train_operation_header_data` (`RailwayLine`, `TrainOperationVersion`, `WeekdayType`, `PlannedTrainOperationID`),
    CONSTRAINT `DPFMTrainOperationHeaderDataDptStation_fk` FOREIGN KEY (`RailwayLine`, `DepartureStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `Station`),
    CONSTRAINT `DPFMTrainOperationHeaderDataDstStation_fk` FOREIGN KEY (`RailwayLine`, `DestinationStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `Station`),
    CONSTRAINT `DPFMTrainOperationHeaderDataDptDstStation_fk` FOREIGN KEY (`RailwayLine`, `DepartureStation`, `DestinationStation`) REFERENCES `data_platform_station_header_data` (`RailwayLine`, `DepartureStation`, `DestinationStation`),
    CONSTRAINT `DPFMTrainOperationHeaderDataCreateUser_fk` FOREIGN KEY (`CreateUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`),
    CONSTRAINT `DPFMTrainOperationHeaderDataLastChangeUser_fk` FOREIGN KEY (`LastChangeUser`) REFERENCES `data_platform_business_partner_general_data` (`BusinessPartner`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
