/*
 * Copyright 2018 IBM Corp. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

DROP TABLE Dept$
DROP TABLE WorkLocation$
DROP TABLE Employee$
DROP TABLE ContactList$
DROP TABLE ContactEmail$
DROP TABLE ContactPhone$
DROP TABLE EmpSalaryAnalysis$
DROP TABLE PatientTable$

CREATE TABLE Dept (
  DEPCODE INT NOT NULL,
  DEPNAME VARCHAR(40) NOT NULL,
  MANAGER INT,
    PRIMARY KEY(DEPCODE)
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Department.csv' of DEL modified by coldel; skipcount 1 insert into Dept$

CREATE TABLE WorkLocation (
  WLID INT NOT NULL,
  WLName VARCHAR(40) NOT NULL,
  ADDR1 VARCHAR(40),
  ADDR2 VARCHAR(40),
  ADDR3 VARCHAR(40),
  ADDR4 VARCHAR(40),
  ADDR5 VARCHAR(40),
  ADDR6 VARCHAR(40),
  ADDR7 VARCHAR(40),
    PRIMARY KEY(WLID)
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Location.csv' of DEL modified by coldel; skipcount 1 insert into WorkLocation$

CREATE TABLE Employee (
  PNUM INT NOT NULL,
  FNAME VARCHAR(40) NOT NULL,
  LNAME VARCHAR(120) NOT NULL,
  EMPSTATUS INT NOT NULL,
  LVL INT NOT NULL,
  DEPT INT NOT NULL,
  ROLE VARCHAR(40) NOT NULL,
  LOCCODE INT NOT NULL,
    PRIMARY KEY(PNUM),
    FOREIGN KEY DEPARTMENT (DEPT) REFERENCES Dept ON DELETE NO ACTION,
    FOREIGN KEY LOCATION (LOCCODE) REFERENCES WorkLocation ON DELETE NO ACTION
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/Employee.csv' of DEL modified by coldel; skipcount 1 insert into Employee$

CREATE TABLE ContactList (
  RecId INT NOT NULL,
  ContactType CHAR NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Company VARCHAR(50) NOT NULL,
  JobTitle VARCHAR(80) NOT NULL,
  WorkLocation INT NOT NULL,
    PRIMARY KEY(RecId),
    FOREIGN KEY LOCATION (WorkLocation) REFERENCES WorkLocation ON DELETE NO ACTION
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactList.csv' of DEL modified by coldel; skipcount 1 insert into ContactList$

CREATE TABLE ContactEmail (
  RedIf INT NOT NULL,
  EType CHAR NOT NULL,
  Email VARCHAR(120) NOT NULL,
    FOREIGN KEY CONTACT (RedIf) REFERENCES ContactList ON DELETE NO ACTION
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactEmail.csv' of DEL modified by coldel; skipcount 1 insert into ContactEmail$

CREATE TABLE ContactPhone (
  RecId INT NOT NULL,
  ContactType CHAR NOT NULL,
  Number VARCHAR(40) NOT NULL,
    FOREIGN KEY CONTACT (RecId) REFERENCES ContactList ON DELETE NO ACTION
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/ContactPhone.csv' of DEL modified by coldel; skipcount 1 insert into ContactPhone$

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
  TAXP INT NOT NULL,
    FOREIGN KEY EMPLOYEE (PNUM) REFERENCES Employee ON DELETE NO ACTION
)$
import from '{{ ibm_infosvr_samples_cocopharma_targets.files }}/EmpSalaryAnalysis.csv' of DEL modified by coldel; skipcount 1 insert into EmpSalaryAnalysis$

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
