CREATE TABLE Product (
  ProductID int Identity(1001,1) Primary Key,
  Name varchar(55) NOT NULL,
  GenericName varchar(55) NOT NULL,
  Category varchar(55) NOT NULL,
  City varchar(55) NOT NULL,
  Price decimal(10,2) NOT NULL,
  Quantity int,
  ManufactureDate date,
  SupplyDate date,
  ExpiryDate date,
);

INSERT INTO Product VALUES ('Matamizol', 	'Dxycycline',	'Antipyretic',	'Bloomington',	'10.09',	'43',	'2020-08-19',	'2020-10-13',	'2021-08-19'	),
(	 'Adoxa CK', 	'Doxycycline',	'Antibiotic',	'Bartlett',	'67.66',	'333',	'2020-08-10',	'2020-10-23',	'2021-08-10'	),
(	 'Adoxa Pak', 	'Doxycycline',	'Antibiotic',	'Woodridge',	'78.77',	'556',	'2020-08-11',	'2020-10-23',	'2021-08-11'	),
(	 'Aleve', 	'naproxen',	'NSAID',	'Hinsdale',	'11.38',	'666',	'2020-02-22',	'2020-05-02',	'2021-02-22'	),
(	 'Aleve Caplet', 	'naproxen',	'NSAID',	'Woodridge',	'8.94',	'56',	'2020-02-29',	'2020-09-10',	'2021-03-01'	),
(	 'Aleve Easy Open Arthritis', 	'naproxen',	'NSAID',	'Bloomington',	'4.67',	'94',	'2020-03-01',	'2020-09-10',	'2021-03-02'	),
(	 'Aleve Easy Open Arthritis', 	'Ciprofloxacin',	'Antibiotic',	'Woodridge',	'7.67',	'54',	'2020-03-03',	'2020-09-10',	'2021-03-04'	),
(	 'Amoxil', 	'Amoxicillin',	'Penicillin antibiotic',	'Hinsdale',	'3.22',	'34',	'2020-02-09',	'2020-03-20',	'2021-02-09'	),
(	 'Amrix', 	'Cyclobenzaprine',	'Muscle relaxant',	'Hinsdale',	'9.87',	'45',	'2020-02-14',	'2020-04-02',	'2021-02-14'	),
(	 'Anacin', 	'Acetaminnophen',	'Pain reliever',	'Hinsdale',	'5.78',	'45',	'2020-05-04',	'2020-06-03',	'2021-05-04'	),
(	 'Anaprox', 	'naproxen',	'NSAID',	'Bartlett',	'6.72',	'35',	'2020-02-28',	'2020-09-10',	'2021-02-28'	),
(	 'CeleXa', 	'Citalopram',	'Antidepressant',	'Chicago',	'65.72',	'450',	'2020-08-07',	'2020-10-23',	'2021-08-07'	),
(	 'Cepacol', 	'Acetaminnophen',	'Pain reliever',	'Lombard',	'10.05',	'9',	'2020-08-05',	'2020-10-23',	'2021-08-05'	),
(	 'Children Tylenol', 	'Acetaminnophen',	'Pain reliever',	'Woodridge',	'9.53',	'67',	'2020-08-04',	'2020-10-23',	'2021-08-04'	),
(	 'Comfort Pac with Cyclobenzaprine', 	'Cyclobenzaprine',	'Muscle relaxant',	'Bloomington',	'89.56',	'78',	'2020-02-15',	'2020-04-02',	'2021-02-15'	),
(	 'Dayquil', 	'Acetaminnophen',	'Pain reliever',	'Wheaton',	'6.72',	'78',	'2020-05-06',	'2020-06-03',	'2021-05-06'	),
(	 'Diskets', 	'Methadone',	'Opiod',	'Chicago',	'10.18',	'8',	'2020-02-21',	'2020-05-02',	'2021-02-21'	),
(	 'Dolophine', 	'Methadone',	'Opiod',	'Lombard',	'4.67',	'90',	'2020-02-18',	'2020-05-02',	'2021-02-18'	),
(	 'EC-Naprosyn', 	'naproxen',	'NSAID',	'Chicago',	'12.57',	'33',	'2020-02-23',	'2020-05-02',	'2021-02-23'	),
(	 'Entresto', 	'Entresto',	'ARB',	'Bartlett',	'8.98',	'234',	'2020-03-02',	'2020-09-10',	'2021-03-03'	),
(	 'Fexmid', 	'Cyclobenzaprine',	'Muscle relaxant',	'Bartlett',	'4.65',	'2',	'2020-02-16',	'2020-04-02',	'2021-02-16'	),
(	 'Flanax Pain Reliever', 	'naproxen',	'NSAID',	'Lombard',	'13.78',	'66',	'2020-02-24',	'2020-05-02',	'2021-02-24'	),
(	 'Flexeri', 	'Cyclobenzaprine',	'Muscle relaxant',	'Woodridge',	'3',	'3',	'2020-02-17',	'2020-04-02',	'2021-02-17'	),
(	 'Gilenya', 	'Gilenya',	'Immunosuppressant',	'Wheaton',	'5.67',	'45',	'2020-08-08',	'2020-10-23',	'2021-08-08'	),
(	 'Methadose', 	'Methadone',	'Opiod',	'Hinsdale',	'8.98',	'6',	'2020-02-19',	'2020-05-02',	'2021-02-19'	),
(	 'Methadose Sugar-Free', 	'Methadone',	'Opiod',	'Chicago',	'8.99',	'657',	'2020-02-20',	'2020-05-02',	'2021-02-20'	),
(	 'Midol Extended Relief', 	'naproxen',	'NSAID',	'Hinsdale',	'14.98',	'555',	'2020-02-25',	'2020-08-03',	'2021-02-25'	),
(	 'Mondoxyne NL', 	'Doxycycline',	'Antibiotic',	'Woodridge',	'6.56',	'654',	'2020-02-07',	'2020-03-20',	'2021-02-07'	),
(	 'Morgidox', 	'Doxycycline',	'Antibiotic',	'Bartlett',	'7.98',	'870',	'2020-02-06',	'2020-03-20',	'2021-02-06'	),
(	 'Moxatag', 	'Amoxicillin',	'Penicillin antibiotic',	'Bartlett',	'3.56',	'343',	'2020-02-11',	'2020-04-02',	'2021-02-11'	),
(	 'Naprelan', 	'naproxen',	'NSAID',	'Chicago',	'5.78',	'88',	'2020-02-26',	'2020-09-10',	'2021-02-26'	),
(	 'Naprosyn', 	'naproxen',	'NSAID',	'Bloomington',	'8.91',	'11',	'2020-02-27',	'2020-09-10',	'2021-02-27'	),
(	 'Nyquil', 	'Acetaminnophen',	'Pain reliever',	'Bloomington',	'8.94',	'53',	'2020-05-07',	'2020-06-03',	'2021-05-07'	),
(	 'Oracea', 	'Doxycycline',	'Antibiotic',	'Lombard',	'10.65',	'357',	'2020-01-04',	'2020-03-20',	'2020-01-16'	),
(	 'Oraxyl', 	'Doxycycline',	'Antibiotic',	'Hinsdale',	'7.87',	'790',	'2020-02-02',	'2020-04-02',	'2021-02-02'	),
(	 'Ozempic', 	'Ozempic',	'harmone',	'Lombard',	'45.56',	'623',	'2020-02-08',	'2020-03-20',	'2021-02-08'	),
(	 'Plaquenil', 	'hydroxychloroquine',	'Quinoline medicine',	'Bartlett',	'6.78',	'8',	'2020-03-05',	'2020-08-03',	'2021-03-06'	),
(	 'Plaquenil Sulfate', 	'hydroxychloroquine',	'Quinoline medicine',	'Woodridge',	'13.78',	'56',	'2020-03-06',	'2020-08-03',	'2021-03-07'	),
(	 'Proquin XR', 	'Ciprofloxacin',	'Antibiotic',	'Bloomington',	'3.45',	'90',	'2020-03-04',	'2020-08-03',	'2021-03-05'	),
(	 'Q-Pap', 	'Acetaminnophen',	'Pain reliever',	'Chicago',	'8.91',	'43',	'2020-05-05',	'2020-06-03',	'2021-05-05'	),
(	 'Quineprox', 	'hydroxychloroquine',	'Quinoline medicine',	'Lombard',	'14.98',	'45',	'2020-03-07',	'2020-08-03',	'2021-03-08'	),
(	 'Trimox', 	'Amoxicillin',	'Penicillin antibiotic',	'Bloomington',	'1.09',	'222',	'2020-02-10',	'2020-03-20',	'2021-02-10'	),
(	 'Tylenol', 	'Acetaminnophen',	'Pain reliever',	'Lombard',	'6.78',	'23',	'2020-05-03',	'2020-06-03',	'2021-05-03'	),
(	 'Vibramycin calcium', 	'Doxycycline',	'Antibiotic',	'Chicago',	'32.63',	'65',	'2020-02-03',	'2020-03-20',	'2021-02-03'	),
(	 'Vibramycin Hyclate', 	'Doxycycline',	'Antibiotic',	'Wheaton',	'33.39',	'234',	'2020-02-04',	'2020-03-20',	'2021-02-04'	),
(	 'Vibramycin monohydrate', 	'Doxycycline',	'Antibiotic',	'Bloomington',	'5.66',	'456',	'2020-02-05',	'2020-03-20',	'2021-02-05'	),
(	 'Vicks', 	'Acetaminnophen',	'Pain reliever',	'Bartlett',	'9.04',	'34',	'2020-05-08',	'2020-06-03',	'2021-05-08'	),
(	 'Vicodin', 	'Acetaminnophen',	'Pain reliever',	'Hinsdale',	'87.98',	'234',	'2020-08-06',	'2020-10-23',	'2021-08-06'	),
(	 'Xanax', 	'Xanax',	'Benzodiazepine',	'Woodridge',	'3.56',	'657',	'2020-02-12',	'2020-04-02',	'2021-02-12'	),
(	 'Xanax XR', 	'Xanax',	'Benzodiazepine',	'Lombard',	'8.69',	'777',	'2020-02-13',	'2020-04-02',	'2021-02-13'	);

