# Vehicle Extension
-------------------
# Codeunit 
51500 Event Subscriptions
    Table = Vehicle x 2, Customer x 2, Vehicle Make x 2
    Page = Customer Card x 2
    Codeunit = Dim Mgmt x 2 
51501 Vehicle Maintenance
    Proc = ComputeArithmeticMean
# Enum 
51500 Vehicle Fuel Type - Petrol, Electric, Diesel, Hybrid
# Page
51500 KNH Vehicle Card
51501 KNH Vehicle List
51502 KNH Vehicle Journeys
51503 Vehicle Setup
51504 Vehicle Journal Template
51505 Vehicle Balances
51506 Vehicle Make
51507 Vehicle Model
51508 Vehicle Maintenance
51509 HeadLine RC Vehicles
51510 Vehicle Activities
# Query
51500 Vehicle - Dataset Vehicle, Vehicle Journey
51501 Vehicle Journey Count - Dataset Vehicle Journey
51502 Vehicle Make - Dataset Vehicle Make
# Report
51500 Vehicle Journey - Dataitem Vehicle Journey
51501 Vehicle Balance - Dataitem Vehicle
# Table
51500 Vehicle 
    PK = No.
    FK - New Cost, GD1 Code, GD2 Code
    FF - Make Code, Model Code, Vehicle Mileage
    Filters - Date 
    Trigger - OnIsert
    LProc - TestNoSeries, InitVehicleNo, AssistEdit, ValidateShortcutDimCode
    Events - OnBeforeValidateRegistrationNo, OnAfterValidateRegistrationNo

51501 Vehicle Make
    PK = Code
    Foreign Keys - Country
    Events - OnBeforeValidateCountry, OnAfterValidateCountry

51502 Vehicle Model
    PK = Code

51503 Vehicle Journey
    PK = Entry No.

51504 Vehicle Setup
    PK = Primary Key

51505 Vehicle Journal Template
    PK = Name
    FK = Test Report ID, Posting Report ID, No. Series, Posting No. Series, Reason Code, Source Code
    FF = Test Report Caption, Posting Report Caption
    Triggers = OnDelete

51506 Vehicle Journal Batch
    PK = Journal Template Name, Name
    FK = Journal Template Name, Reason Code, No. Series, Posting No. Series
    FF = Template Type
    Triggers = OnDelete, OnInsert, OnRename, 
    Proc = SetupNewBatch

51507 Vehicle Journal Line
    PK = Journal Template Name, Journal Batch Name, Line No.
    FK = Vehicle No., Source No., Source Posting Group, Source Code, SC Dim1 Code, SC Dim2 Code

51508 Vehicle Cue
    PK = Primary Key
    FF = Vehicle Journeys, Vehicle Cost, Vehicle Value