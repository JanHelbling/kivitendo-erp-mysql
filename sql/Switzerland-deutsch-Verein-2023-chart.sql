-- deutschsprachiger Kontenplan nach Schweizer Kontenrahmen KMU spezifisch angepasst für mehrwertsteuerpflichtige Vereine in der Schweiz
-- für kivitendo aufbereitet am 11.4.2017, kleinere Korrekturen am 15.7.2017 und 19.2.2023
-- Grundlage: Revision OR Stand 1.1.2013, insbesondere Art. 957a Abs. 2
-- MWST 7.7% und 2.5%
-- Autor: Kurt Pfister, http://www.gotransparent.ch
-- Redaktion: Andreas Rudin, http://www.revamp-it.ch
-- Copyright 2014,2017,2023 Kurt Pfister, Andreas Rudin

-- This file is part of kivitendo.
-- kivitendo is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
-- 
-- kivitendo is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with kivitendo. If not, see <http://www.gnu.org/licenses/>.

-- Diese Datei ist Teil von kivitendo.
--
-- kivitendo ist Freie Software: Sie können es unter den Bedingungen
-- der GNU General Public License, wie von der Free Software Foundation,
-- Version 2 der Lizenz oder (nach Ihrer Wahl) jeder späteren
-- veröffentlichten Version, weiterverbreiten und/oder modifizieren.
--
-- kivitendo wird in der Hoffnung, dass es nützlich sein wird, aber
-- OHNE JEDE GEWÄHRLEISTUNG, bereitgestellt; sogar ohne die implizite
-- Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
-- Siehe die GNU General Public License für weitere Details.
--
-- Sie sollten eine Kopie der GNU General Public License zusammen mit diesem
-- Programm erhalten haben. Wenn nicht, siehe <http://www.gnu.org/licenses/>. 

DELETE FROM chart;

INSERT INTO chart (accno, description, charttype, category, link, gifi_accno, taxkey_id, pos_ustva, pos_bwa, pos_bilanz, pos_eur, datevautomatik, valid_from) VALUES
('1',    'AKTIVEN','H','','','1',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('10',   'UMLAUFVERMÖGEN','H','','','10',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('100',  'Flüssige Mittel','H','','','100',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1000', 'Kasse','A','A','AR_paid:AP_paid','1000',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1010', 'Postfinance','A','A','AR_paid:AP_paid','1010',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1020', 'Bank','A','A','AR_paid:AP_paid','1020',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('106',  'Kurzfristig gehaltene Aktiven mit Börsenkurs','H','','','106',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1060', 'Wertschriften','A','A','','1060',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('110',  'Forderungen aus Lieferungen und Leistungen','H','','','110',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1100', 'Debitoren CHF','A','A','AR','1100',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1101', 'Debitoren EUR','A','A','AR','1101',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1107', 'Forderungen an Kreditkarten','A','A','','1107',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1109', 'Delkredere','A','A','','1109',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('114',  'Übrige kurzfristige Forderungen','H','','','114',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1140', 'Vorschüsse, kurzfristige Darlehen','A','A','','1140',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1160', 'Kontokorrent Mitglied/Vorstand/GL','A','A','','1160',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1170', 'MWST Vorsteuer Material/Dienstleistungen','A','A','AP_tax:IC_taxpart:IC_taxservice','1170',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1171', 'MWST Vorsteuer Investitionen/übr. Betriebsaufwand','A','A','AP_tax:IC_taxpart:IC_taxservice','1171',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1176', 'Verrechnungssteuer','A','A','','1176',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1181', 'Familienzulagen','A','A','','1181',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1191', 'Kautionen','A','A','','1191',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1192', 'Geleistete Anzahlungen','A','A','','1192',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('120',  'Vorräte und nicht fakturierte Dienstleistungen','H','','','120',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1200', 'Handelswaren','A','A','IC','1200',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1209', 'Wertberichtigung Handelswaren','A','A','','1209',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1210', 'Rohstoffe','A','A','IC','1210',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1219', 'Wertberichtigung Rohstoffe','A','A','','1219',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1260', 'Fertige Erzeugnisse','A','A','IC','1260',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1269', 'Wertberichtigung fertige Erzeugnisse','A','A','','1269',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1280', 'Nicht fakturierte Dienstleistungen','A','A','IC','1280',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('130',  'Aktive Rechnungsabgrenzung','H','','','130',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1300', 'Bezahlter Aufwand des Folgejahrs','A','A','','1300',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1301', 'Noch nicht erhaltener Ertrag','A','A','','1301',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('14',   'ANLAGEVERMÖGEN','H','','','14',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('140',  'Finanzanlagen','H','','','140',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1400', 'Wertschriften','A','A','IC','1400',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1411', 'Mietzinsdepot','A','A','IC','1411',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1440', 'Darlehen','A','A','IC','1440',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1460', 'Darlehen an Mitglied/Vorstand/GL','A','A','IC','1460',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('148',  'Beteiligungen','H','','','148',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1480', 'Beteiligung','A','A','IC','1480',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1489', 'Wertberichtigung Beteiligung','A','A','','1489',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('150',  'Mobile Sachanlagen','H','','','150',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1500', 'Maschinen und Apparate','A','A','IC','1500',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1509', 'Wertberichtigung Maschinen und Apparate','A','A','','1509',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1510', 'Mobiliar und Einrichtungen','A','A','IC','1510',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1519', 'Wertberichtigung Mobiliar und Einrichtungen','A','A','','1519',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1520', 'Informatik und Kommunikation','A','A','IC','1520',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1529', 'Wertberichtigung Informatik und Kommunikation','A','A','','1529',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1530', 'Fahrzeuge','A','A','IC','1530',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1539', 'Wertberichtigung Fahrzeuge','A','A','','1539',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1540', 'Werkzeug und Geräte','A','A','IC','1540',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1549', 'Wertberichtigung Werkzeug und Geräte','A','A','','1549',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('160',  'Immobile Sachanlagen','H','','','160',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1600', 'Geschäftsliegenschaft','A','A','IC','1600',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1609', 'Wertberichtigung Geschäftsliegenschaft','A','A','','1609',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('170',  'Immaterielle Werte','H','','','170',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1700', 'Patent, Konzession, Rechte','A','A','IC','1700',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('1709', 'Wertberichtigung Patent, Konzession, Rechte','A','A','','1709',6,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2',    'PASSIVEN','H','','','2',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('20',   'KURZFRISTIGES FREMDKAPITAL','H','','','20',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('200',  'Verbindlichkeiten aus Lieferungen und Leistungen','H','','','200',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2000', 'Kreditoren CHF','A','L','AP','2000',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2001', 'Kreditoren EUR','A','L','AP','2001',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2030', 'Erhaltene Anzahlungen von Kundinnen und Kunden','A','L','','2030',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('210',  'Kurzfristige verzinsliche Verbindlichkeiten','H','','','210',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2100', 'Bank','A','L','AR_paid:AP_paid','2100',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2160', 'Verzinsliche Verbindlichkeiten gegenüber Mitglied/Vorstand/GL','A','L','','2160',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('220',  'Übrige kurzfristige Verbindlichkeiten','H','','','220',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2200', 'MWST Umsatzsteuer','A','L','AR_tax:IC_taxpart:IC_taxservice','2200',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2201', 'MWST Abrechnungskonto','A','L','','2201',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2203', 'MWST Bezugssteuer','A','L','','2203',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2206', 'Verrechnungssteuer','A','L','','2206',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2208', 'Direkte Steuern','A','L','','2208',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2210', 'Übrige kurzfristige Verbindlichkeiten','A','L','','2210',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2260', 'Verbindlichkeiten gegenüber Mitglied/Vorstand/GL','A','L','','2260',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2270', 'Kontokorrent Berufliche Vorsorge','A','L','','2270',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2271', 'Kontokorrent AHV,IV,EO,ALV','A','L','','2271',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2272', 'Kontokorrent FAK','A','L','','2272',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2273', 'Kontokorrent Unfallversicherung','A','L','','2273',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2274', 'Kontokorrent Krankentaggeldversicherung','A','L','','2274',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2279', 'Kontokorrent Quellensteuer','A','L','','2279',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('230',  'Passive Rechnungsabgrenzung','H','','','230',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2300', 'Noch nicht bezahlter Aufwand','A','L','','2300',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2301', 'Erhaltener Ertrag des Folgejahrs','A','L','','2301',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('24',   'LANGFRISTIGES FREMDKAPITAL','H','','','24',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('240',  'Langfristige verzinsliche Verbindlichkeiten','H','','','240',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2401', 'Hypothek','A','L','','2401',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2450', 'Verzinsliche Darlehen','A','L','','2450',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('250',  'Übrige langfristige Verbindlichkeiten','H','','','250',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2500', 'Zinslose Darlehen','A','L','','2500',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2560', 'Darlehen von Mitglied/Vorstand/GL','A','L','','2560',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('260',  'Rückstellungen langfristig','H','','','260',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2630', 'Rückstellung für Garantieverpflichtungen','A','L','','2630',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('28',   'EIGENKAPITAL','H','','','28',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('280',  'Organisationskapital','H','','','280',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2800', 'Vereinsvermögen','A','Q','','2800',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('290',  'Jahresgewinn oder Jahresverlust','H','','','290',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('2979', 'Jahresgewinn oder Jahresverlust','A','Q','','2979',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3',    'BETRIEBSERTRAG','H','','','3',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('30',   'PRODUKTIONSERLÖS','H','','','30',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3000', 'Produktionserlös','A','I','AR_amount:IC_sale','3000',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('32',   'HANDELSERLÖSE','H','','','32',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3200', 'Handelserlöse','A','I','AR_amount:IC_sale','3200',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('34',   'DIENSTLEISTUNGSERLÖSE','H','','','34',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3400', 'Dienstleistungserlöse','A','I','AR_amount:IC_income','3400',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('36',   'ÜBRIGE ERLÖSE','H','','','36',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3600', 'Spenden','A','I','AR_amount:IC_income','3600',1,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3660', 'Mitgliederbeiträge','A','I','AR_amount:IC_income','3660',1,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3680', 'Sonstige Erlöse','A','I','AR_amount:IC_sale:IC_income','3680',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('37',   'EIGENLEISTUNGEN UND EIGENVERBRAUCH','H','','','37',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3700', 'Eigenleistungen','A','I','','3700',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('38',   'ERLÖSMINDERUNGEN','H','','','38',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3800', 'Skonti','A','E','AR_paid','3800',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3801', 'Rabatte, Preisnachlässe','A','E','AR_paid','3801',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3805', 'Verluste aus Forderungen, Veränderungen Delkredere','A','E','AR_paid','3805',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3809', 'MWST Saldosteuersatz','A','E','AR_paid','3809',0,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('39',   'BESTANDESÄNDERUNGEN','H','','','39',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('3901', 'Bestandesänderung fertige Erzeugnisse','A','I','','3901',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('3940', 'Bestandesänderung nicht fakturierte Dienstleistungen','A','I','','3940',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('4',    'AUFWAND FÜR LEISTUNGSERSTELLUNG','H','','','4',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('40',   'MATERIALAUFWAND','H','','','40',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4000', 'Materialeinkauf','A','E','AP_amount:IC_cogs','4000',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('42',   'HANDELSWARENAUFWAND','H','','','42',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4200', 'Einkauf Handelswaren','A','E','AP_amount:IC_cogs','4200',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('44',   'AUFWAND FÜR BEZOGENE DRITTLEISTUNGEN','H','','','44',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4400', 'Aufwand für Drittleistungen','A','E','AP_amount:IC_expense','4400',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('45',   'ENERGIEAUFWAND ZUR LEISTUNGSERSTELLUNG','H','','','45',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4500', 'Energieaufwand zur Leistungserstellung','A','E','AP_amount:IC_expense','4500',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('48',   'BESTANDESÄNDERUNGEN','H','','','48',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4800', 'Bestandesänderungen','A','E','','4800',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('49',   'EINKAUFSPREISMINDERUNGEN','H','','','49',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('4900', 'Skonti, Rabatte, Preisnachlässe','A','I','AP_paid','4900',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5',    'PERSONALAUFWAND','H','','','5',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('50',   'LÖHNE UND GEHÄLTER','H','','','500',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('5000', 'Bruttolohn','A','E','IC_expense','5000',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5002', 'Erfolgsbeteiligung','A','E','IC_expense','5002',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5005', 'Leistungen von Sozialversicherungen','A','I','IC_income','5005',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('57',   'SOZIALVERSICHERUNGSAUFWAND','H','','','57',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('5700', 'AHV, IV, EO, ALV','A','E','AP_amount:IC_expense','5700',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5710', 'FAK','A','E','AP_amount:IC_expense','5710',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5720', 'Berufliche Vorsorge','A','E','AP_amount:IC_expense','5720',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5730', 'Unfallversicherung','A','E','AP_amount:IC_expense','5730',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5740', 'Krankentaggeldversicherung','A','E','AP_amount:IC_expense','5740',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5790', 'Quellensteuer','A','E','AP_amount:IC_expense','5790',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('58',   'ÜBRIGER PERSONALAUFWAND','H','','','58',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('5800', 'Aufwand für Personaleinstellung','A','E','IC_expense','5800',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5810', 'Aus- und Weiterbildung','A','E','IC_expense','5810',1,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5830', 'Spesenentschädigung','A','E','IC_expense','5830',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('5880', 'Sonstiger Personalaufwand','A','E','IC_expense','5880',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('59',   'LEISTUNGEN DRITTER','H','','','59',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('5900', 'Fremdarbeit, Temporärpersonal','A','E','IC_expense','5900',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6',    'ÜBRIGER BETRIEBSAUFWAND','H','','','6',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('60',   'RAUMAUFWAND','H','','','60',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6000', 'Miete','A','E','AP_amount:IC_expense','6000',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6040', 'Reinigung','A','E','AP_amount:IC_expense','6040',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6050', 'Übriger Raumaufwand','A','E','AP_amount:IC_expense','6050',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('61',   'UNTERHALT, REPARATUREN, ERSATZ, LEASING','H','','','61',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6100', 'Unterhalt Maschinen und Apparate','A','E','AP_amount:IC_expense','6100',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6110', 'Unterhalt Mobiliar und Einrichtungen','A','E','AP_amount:IC_expense','6110',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6120', 'Unterhalt Informatik und Kommunikation','A','E','AP_amount:IC_expense','6120',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6140', 'Unterhalt Werkzeug und Geräte','A','E','AP_amount:IC_expense','6140',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6150', 'Leasing','A','E','AP_amount:IC_expense','6150',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('62',   'FAHRZEUG- UND TRANSPORTAUFWAND','H','','','62',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6200', 'Fahrzeugaufwand','A','E','AP_amount:IC_expense','6200',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6201', 'Transportaufwand','A','E','AP_amount:IC_expense','6201',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('63',   'SACHVERSICHERUNGEN, ABGABEN, GEBÜHREN','H','','','63',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6300', 'Betriebsversicherung','A','E','AP_amount:IC_expense','6300',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6360', 'Abgaben, Gebühren und Bewilligungen','A','E','AP_amount:IC_expense','6360',1,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('64',   'ENERGIE- UND ENTSORGUNGSAUFWAND','H','','','64',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6400', 'Strom, Gas, Wasser','A','E','AP_amount:IC_expense','6400',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6460', 'Entsorgungsaufwand','A','E','AP_amount:IC_expense','6460',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('65',   'VERWALTUNGS- UND INFORMATIKAUFWAND','H','','','65',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6500', 'Büromaterial, Drucksachen, Fachliteratur','A','E','AP_amount:IC_expense','6500',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6510', 'Telefon, Porto, Internet','A','E','AP_amount:IC_expense','6510',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6520', 'Beiträge, Spenden','A','E','AP_amount:IC_expense','6520',1,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6530', 'Buchführungs- und Beratungsaufwand','A','E','AP_amount:IC_expense','6530',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6540', 'Vorstandsentschädigung, GV, Revision','A','E','AP_amount:IC_expense','6540',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6570', 'Informatikaufwand','A','E','AP_amount:IC_expense','6570',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6590', 'Übriger Verwaltungsaufwand','A','E','AP_amount:IC_expense','6590',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('66',   'WERBEAUFWAND','H','','','66',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6600', 'Inserate','A','E','AP_amount:IC_expense','6600',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6604', 'Website','A','E','AP_amount:IC_expense','6604',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6620', 'Schaufenster, Messen','A','E','AP_amount:IC_expense','6620',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6640', 'Reisespesen, Kundenbetreuung','A','E','AP_amount:IC_expense','6640',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6660', 'Sponsoring','A','E','AP_amount:IC_expense','6660',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('67',   'SONSTIGER BETRIEBLICHER AUFWAND','H','','','67',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6700', 'Wirtschaftsauskunft, Betreibung','A','E','AP_amount:IC_expense','6700',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6720', 'Forschung und Entwicklung','A','E','AP_amount:IC_expense','6720',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6791', 'Privatanteil Fahrzeug','A','E','AP_amount:IC_expense','6791',6,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('68',   'ABSCHREIBUNG UND WERTBERICHTIGUNG','H','','','68',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6800', 'Wertberichtigung Finanzanlagen','A','E','','6800',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6820', 'Abschreibung mobile Sachanlagen','A','E','','6820',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6830', 'Abschreibung immobile Sachanlagen','A','E','','6830',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6840', 'Abschreibung immaterielle Werte','A','E','','6840',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('69',   'FINANZAUFWAND UND FINANZERTRAG','H','','','69',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('690',  'Finanzaufwand','H','','','690',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6900', 'Zinsaufwand','A','E','','6900',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6940', 'Bankspesen','A','E','','6940',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6943', 'Rundungsaufwand','A','E','','6943',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('6949', 'Währungsverluste','A','E','','6949',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('695',  'Finanzertrag','H','','','695',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('6950', 'Zinsertrag','A','I','','6950',0,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('6953', 'Rundungsertrag','A','I','','6953',0,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('6999', 'Währungsgewinne','A','I','','6999',0,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('7',    'BETRIEBLICHER NEBENERFOLG','H','','','7',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('70',   'ERFOLG AUS NEBENBETRIEBEN','H','','','70',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('75',   'ERFOLG AUS BETRIEBLICHEN LIEGENSCHAFTEN','H','','','75',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('8',    'BETRIEBSFREMDER, AUSSERORDENTLICHER, EINMALIGER UND PERIODENFREMDER ERFOLG','H','','','8',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('80',   'BETRIEBSFREMDER ERFOLG','H','','','80',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('8000', 'Betriebsfremder Aufwand','A','E','AP_amount:IC_cogs:IC_expense','8000',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('8100', 'Betriebsfremder Ertrag','A','I','AR_amount:IC_sale:IC_income','8100',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('85',   'AUSSERORDENTLICHER, EINMALIGER ERFOLG','H','','','85',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('8500', 'Ausserordentlicher Aufwand','A','E','AP_amount:IC_cogs:IC_expense','8500',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('8510', 'Ausserordentlicher Ertrag','A','I','AR_amount:IC_sale:IC_income','8510',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('87',   'PERIODENFREMDER ERFOLG','H','','','87',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('8700', 'Periodenfremder Aufwand','A','E','AP_amount:IC_cogs:IC_expense','8700',4,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('8710', 'Periodenfremder Ertrag','A','I','AR_amount:IC_sale:IC_income','8710',2,NULL,NULL,NULL,1,FALSE,'2017-01-01 00:00:00.000000'),
('89',   'DIREKTE STEUERN','H','','','89',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('8900', 'Direkte Steuern','A','E','','8900',0,NULL,NULL,NULL,6,FALSE,'2017-01-01 00:00:00.000000'),
('9',    'ABSCHLUSS','H','','','9',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('90',   'ERFOLGSRECHNUNG','H','','','90',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('91',   'BILANZ','H','','','91',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('9100', 'Eröffnungsbilanz','A','E','','9100',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('92',   'GEWINNVERWENDUNG','H','','','92',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000'),
('95',   'JAHRESERGEBNISSE','H','','','95',0,NULL,NULL,NULL,NULL,FALSE,'2017-01-01 00:00:00.000000');


DELETE FROM buchungsgruppen;

INSERT INTO buchungsgruppen (
  description, inventory_accno_id,
  income_accno_id_0, expense_accno_id_0,
  income_accno_id_1, expense_accno_id_1,
  income_accno_id_2, expense_accno_id_2,
  income_accno_id_3, expense_accno_id_3
) VALUES (
  'Standard',(SELECT id FROM chart WHERE accno = '1200'),
  (SELECT id FROM chart WHERE accno = '3200'), (SELECT id FROM chart WHERE accno = '4200'),
  (SELECT id FROM chart WHERE accno = '3200'), (SELECT id FROM chart WHERE accno = '4200'),
  (SELECT id FROM chart WHERE accno = '3200'), (SELECT id FROM chart WHERE accno = '4200'),
  (SELECT id FROM chart WHERE accno = '3200'), (SELECT id FROM chart WHERE accno = '4200')
);


DELETE FROM tax_zones;

INSERT INTO tax_zones (id, description) VALUES
(0, 'Schweiz'), -- siehe auch Pg-upgrade2/taxzone_id_in_oe_delivery_orders.sql )=:
(1, 'EU mit USt-ID Nummer'),
(2, 'EU ohne USt-ID Nummer'),
(3, 'Ausserhalb EU');


DELETE FROM tax;

INSERT INTO tax (taxkey, taxdescription, rate) VALUES
(0, 'Keine Steuer', 0),
(1, 'Mehrwertsteuerfrei', 0);

INSERT INTO tax (taxkey, taxdescription, rate, taxnumber, chart_id) VALUES
(2, 'MWST', 0.07700, '2200', (SELECT id FROM chart WHERE accno='2200')),
(3, 'MWST', 0.02500, '2200', (SELECT id FROM chart WHERE accno='2200')),
(4, 'MWST Aufwand', 0.07700, '1170', (SELECT id FROM chart WHERE accno='1170')),
(5, 'MWST Aufwand', 0.02500, '1170', (SELECT id FROM chart WHERE accno='1170')),
(6, 'MWST Investitionen', 0.07700, '1171', (SELECT id FROM chart WHERE accno='1171')),
(7, 'MWST Investitionen', 0.02500, '1171', (SELECT id FROM chart WHERE accno='1171'));


DELETE FROM taxkeys;

INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 0, (SELECT tax.id FROM tax WHERE taxkey=0), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=0;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 1, (SELECT tax.id FROM tax WHERE taxkey=1), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=1;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 2, (SELECT tax.id FROM tax WHERE taxkey=2), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=2;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 3, (SELECT tax.id FROM tax WHERE taxkey=3), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=3;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 4, (SELECT tax.id FROM tax WHERE taxkey=4), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=4;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 5, (SELECT tax.id FROM tax WHERE taxkey=5), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=5;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 6, (SELECT tax.id FROM tax WHERE taxkey=6), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=6;
INSERT INTO taxkeys (taxkey_id, tax_id, chart_id, startdate) SELECT 7, (SELECT tax.id FROM tax WHERE taxkey=7), chart.id, '2017-01-01' FROM chart WHERE taxkey_id=7;


DELETE FROM units;

INSERT INTO units (name, base_unit, factor, type) VALUES
('Stck', NULL, 0.00000, 'dimension'),
('mg', NULL, 0.00000, 'dimension'),
('g', 'mg', 1000.00000, 'dimension'),
('kg', 'g', 1000.00000, 'dimension'),
('t', 'kg', 1000.00000, 'dimension'),
('ml', NULL, 0.00000, 'dimension'),
('L', 'ml', 1000.00000, 'dimension'),
('pauschal', NULL, 0.00000, 'service'),
('Min', NULL, 0.00000, 'service'),
('Std', 'Min', 60.00000, 'service'),
('Tag', 'Std', 8.00000, 'service'),
('Wo', NULL, 0.00000, 'service'),
('Mt', 'Wo', 4.00000, 'service'),
('Jahr', 'Mt', 12.00000, 'service');


DELETE FROM defaults;

INSERT INTO defaults (
  inventory_accno_id,
  income_accno_id, expense_accno_id,
  fxgain_accno_id, fxloss_accno_id,
  invnumber, sonumber,
  weightunit,
  businessnumber,
  version,
  closedto,
  revtrans,
  ponumber, sqnumber, rfqnumber,
  customernumber, vendornumber,
  audittrail,
  articlenumber, servicenumber,
  rmanumber, cnnumber
) VALUES (
  (SELECT id FROM CHART WHERE accno='1200'),
  (SELECT id FROM CHART WHERE accno='3200'), (SELECT id FROM CHART WHERE accno='4200'),
  (SELECT id FROM CHART WHERE accno='6999'), (SELECT id FROM CHART WHERE accno='6949'),
  0, 0,
  'kg',
  '',
  '3.7.0 CH',
  NULL,
  FALSE,
  0, 0, 0,
  0, 0,
  FALSE,
  0, 0,
  0, 0
);
