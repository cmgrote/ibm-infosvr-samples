
connect to {{ ibm_infosvr_samples_cocopharma_targets.db_name | upper }}$

DROP TABLE ContactEmail$
CREATE TABLE ContactEmail (
  RedIf INT NOT NULL,
  EType CHAR NOT NULL,
  Email VARCHAR(120) NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactEmail.csv' of DEL modified by coldel; skipcount 1 insert into ContactEmail$

DROP TABLE ContactList$
CREATE TABLE ContactList (
  RecId INT NOT NULL,
  ContactType CHAR NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Company VARCHAR(50) NOT NULL,
  JobTitle VARCHAR(80) NOT NULL,
  WorkLocation INT NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactList.csv' of DEL modified by coldel; skipcount 1 insert into ContactList$

DROP TABLE ContactPhone$
CREATE TABLE ContactPhone (
  RecId INT NOT NULL,
  ContactType CHAR NOT NULL,
  Number VARCHAR(40) NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactPhone.csv' of DEL modified by coldel; skipcount 1 insert into ContactPhone$

DROP TABLE EmpSalaryAnalysis$
CREATE TABLE EmpSalaryAnalysis (
  HDR INT NOT NULL,
  RECTYPE INT NOT NULL,
  SERVICE INT NOT NULL,
  EMPSTATUS INT NOT NULL,
  FNAME VARCHAR(40) NOT NULL,
  LNAME VARCHAR(40) NOT NULL,
  PNUM INT NOT NULL,
  DEPT INT NOT NULL,
  LVL INT NOT NULL,
  LOCATION VARCHAR(40) NOT NULL,
  LOCCODE INT NOT NULL,
  HOL INT NOT NULL,
  ROLE VARCHAR(40) NOT NULL,
  ETYPE INT NOT NULL,
  SALARY INT NOT NULL,
  BONUS INT NOT NULL,
  SNUM INT NOT NULL,
  STREET VARCHAR(40) NOT NULL,
  CITY VARCHAR(40) NOT NULL,
  STATE VARCHAR(40) NOT NULL,
  TAX INT NOT NULL,
  TAXP INT NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/EmpSalaryAnalysis.csv' of DEL modified by coldel; skipcount 1 insert into EmpSalaryAnalysis$

DROP TABLE Dept$
CREATE TABLE Dept (
  DEPCODE INT NOT NULL,
  DEPNAME VARCHAR(40) NOT NULL,
  MANAGER INT
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Department.csv' of DEL modified by coldel; skipcount 1 insert into Dept$

DROP TABLE Employee$
CREATE TABLE Employee (
  PNUM INT NOT NULL,
  FNAME VARCHAR(40) NOT NULL,
  LNAME VARCHAR(120) NOT NULL,
  EMPSTATUS INT NOT NULL,
  LVL INT NOT NULL,
  DEPT INT NOT NULL,
  ROLE VARCHAR(40) NOT NULL,
  LOCCODE INT NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Employee.csv' of DEL modified by coldel; skipcount 1 insert into Employee$

DROP TABLE WorkLocation$
CREATE TABLE WorkLocation (
  WLID INT NOT NULL,
  WLName VARCHAR(40) NOT NULL,
  ADDR1 VARCHAR(40),
  ADDR2 VARCHAR(40),
  ADDR3 VARCHAR(40),
  ADDR4 VARCHAR(40),
  ADDR5 VARCHAR(40),
  ADDR6 VARCHAR(40),
  ADDR7 VARCHAR(40)
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Location.csv' of DEL modified by coldel; skipcount 1 insert into WorkLocation$

DROP TABLE PatientTable$
CREATE TABLE PatientTable (
  PatientId INT NOT NULL,
  Patient VARCHAR(40) NOT NULL,
  LH_Addr_1 VARCHAR(40),
  LH_Addr_2 VARCHAR(40),
  LH_Addr_3 VARCHAR(40),
  LH_Addr_4 VARCHAR(40),
  LH_Addr_5 VARCHAR(40),
  Trial VARCHAR(10) NOT NULL
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Patient.csv' of DEL modified by coldel; skipcount 1 insert into PatientTable$

terminate$
