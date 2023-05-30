-- Step: 01
-- Goal: Create a new database mvc-2209a-P4-Toets
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `Mvc-2209a-P4-Toets`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `Mvc-2209a-P4-Toets`;

-- Use database Mvc-2209a-P4
Use `Mvc-2209a-P4-Toets`;


-- Step: 02
-- Goal: Create a new table Examen
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

-- Drop table Instructeur
DROP TABLE IF EXISTS Examen;

CREATE TABLE IF NOT EXISTS Examen
(
    Id              			TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,StudentId       			VARCHAR(50)                     NOT NULL
   ,Rijschool   				VARCHAR(10)                     NOT NULL
   ,Stad      					VARCHAR(50)                     NOT NULL
   ,Rijbewijscategorie          VARCHAR(12)                     NOT NULL
   ,Datum   					DATE                            NOT NULL
   ,Uitslag   					VARCHAR(6)                      NOT NULL
   ,IsActief        			BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen     			VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt 			DateTime(6)                     NOT NULL
   ,DatumGewijzigd  			DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Instructeur_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table Instructeur with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

INSERT INTO Examen
(
	StudentId       			
   ,Rijschool   				
   ,Stad      					
   ,Rijbewijscategorie          
   ,Datum   					
   ,Uitslag   					
   ,IsActief        			
   ,Opmerkingen     			
   ,DatumAangemaakt 			
   ,DatumGewijzigd  
)
VALUES
     ('100234', 'VolGasVooruit', 'Rotterdam', 'B', '2023-03-04', 'Geslaagd' 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('123432', 'InZijnVierDoorDeBocht', 'Sliedrecht', 'C', '2023-01-03', 'Geslaagd' 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('103234', 'LinksomRechtsom', 'Dordrecht', 'D', '2023-15-05', 'Geslaagd' 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('106452', 'OpDeVluchtStrook', 'Zwijndrecht', 'AM', '2023-08-05', 'Gezakt', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('104546', 'RechtDoorEnGaan', 'Rotterdam', 'B', '2023-17-04', 'Gezakt' 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('100333', 'AltijdGeslaagd', 'Dordrecht', 'B', '2023-12-05', 'Geslaagd', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('124444', 'RijlesVoorJou', 'Rotterdam', 'B', '2023-12-04', 'Geslaagd' 1, NULL, SYSDATE(6), SYSDATE(6));



-- Step: 04
-- Goal: Create a new table ExamenPerExaminator
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

-- Drop table TypeVoertuig
DROP TABLE IF EXISTS ExamenPerExaminator;

CREATE TABLE IF NOT EXISTS ExamenPerExaminator
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,ExamenId        	VARCHAR(20)                     NOT NULL
   ,ExaminatorId  		VARCHAR(5)                      NOT NULL
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_TypeVoertuig_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 05
-- Goal: Fill table TypeVoertuig with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

INSERT INTO ExamenPerExaminator
(
	ExamenId        	
   ,ExaminatorId  		
   ,IsActief           
   ,Opmerkingen         
   ,DatumAangemaakt     
   ,DatumGewijzigd      
)
VALUES
     ('1', '3', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('3', '3', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('2', '2', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('4', '1', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('7', '3', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('6', '2', 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('5', '4', 1, NULL, SYSDATE(6), SYSDATE(6));



-- Step: 06
-- Goal: Create a new table Voertuig
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

-- Drop table Voertuig
DROP TABLE IF EXISTS Examinator;

CREATE TABLE IF NOT EXISTS Examinator
(
    Id                  TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam            VARCHAR(12)                     NOT NULL
   ,Tussenvoegsel       VARCHAR(20)                     NOT NULL
   ,Achternaam          DATE                            NOT NULL
   ,Mobiel          	VARCHAR(20)                     NOT NULL  
   ,IsActief            BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen         VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt     DateTime(6)                     NOT NULL
   ,DatumGewijzigd      DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_Voertuig_Id   PRIMARY KEY CLUSTERED(Id)
   ,CONSTRAINT      FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id  FOREIGN KEY (TypeVoertuigId) REFERENCES TypeVoertuig(Id)
) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table Voertuig with data
-- **********************************************************************************

-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            30-05-2023      Amine Azzamouri            New
-- **********************************************************************************/

INSERT INTO Examinator
(
   Voornaam           
   ,Tussenvoegsel     
   ,Achternaam        
   ,Mobiel          
   ,IsActief           
   ,Opmerkingen        
   ,DatumAangemaakt     
   ,DatumGewijzigd    
)
VALUES
     ('Manuel', 'van', 'Meekeren', '06-28493832',  1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Lissette', 'den', 'Dongen', '06-24383299',  1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Jurswailly', '', 'Luciano', '06-48293846',  1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Naswha', '', 'Salawi', '06-34291214',  1, NULL, SYSDATE(6), SYSDATE(6));

