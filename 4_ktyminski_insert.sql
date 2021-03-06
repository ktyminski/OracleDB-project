--najemca--
INSERT INTO Najemca (imie, nazwisko ,pesel) VALUES ('Jan', 'Kowalski', '94030489654');
INSERT INTO Najemca (imie, nazwisko ,pesel) VALUES ('Pawe�', 'Jackiewicz', '94030486654');
INSERT INTO Najemca (imie, nazwisko ,pesel) VALUES ('Tomasz', 'Andrzejewski', '94030489666');
INSERT INTO Najemca (imie, nazwisko ,pesel) VALUES ('Tomasz', 'Kokosz', '94030484545');
INSERT INTO Najemca (imie, nazwisko ,pesel) VALUES ('Janek', 'Niemi�y', '94030484546');

--wynajmujacy--

INSERT INTO Wynajmujacy (imie, nazwisko ,pesel) VALUES ('Janusz', 'Tracz', '94030489611');
INSERT INTO Wynajmujacy (imie, nazwisko ,pesel) VALUES ('Pawel', 'Kowal', '94030486622');
INSERT INTO Wynajmujacy (imie, nazwisko ,pesel) VALUES ('Michal', 'Aniol', '94030489633');

--prezes--

INSERT INTO Prezes (imie, nazwisko ,pesel) VALUES ('Janusz', 'Wolcik', '94030119611');
INSERT INTO Prezes (imie, nazwisko ,pesel) VALUES ('Marek', 'Mostowiak', '94030226622');
INSERT INTO Prezes (imie, nazwisko ,pesel) VALUES ('John', 'Wayne', '94030339633');

--ekipa--remontowa

INSERT INTO Ekipa_remontowa (liczebnosc, nazwa) VALUES (3, 'PRACOWNIX');
INSERT INTO Ekipa_remontowa (liczebnosc, nazwa) VALUES (10, 'REMONTEX');
INSERT INTO Ekipa_remontowa (liczebnosc, nazwa) VALUES (2, 'JA I SZWAGIER');

--dostepnosc--

INSERT INTO Dostepnosc (dzien) VALUES (TO_DATE('2018/01/07', 'yyyy/mm/dd'));
INSERT INTO Dostepnosc (dzien) VALUES (TO_DATE('2018/01/08', 'yyyy/mm/dd'));
INSERT INTO Dostepnosc (dzien) VALUES (TO_DATE('2018/01/09', 'yyyy/mm/dd'));

--rejon--

INSERT INTO Rejon (nazwa, dzielnica, miasto) VALUES ('Obszar 1','Wrzeszcz','Gdansk');
INSERT INTO Rejon (nazwa, dzielnica, miasto) VALUES ('Obszar 2','Oliwa','Gdansk');
INSERT INTO Rejon (nazwa, dzielnica, miasto) VALUES ('Obszar 3','Centrum','Gdynia');

-- firma sprz / biuro / spoldzielnia --

INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('HOUSERENT', 1);
INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('RENTALS', 2);
INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('WYNAJMEX', 3);
INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('HOUSEE', 1);
INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('WYNAJMIJX', 2);
INSERT INTO Biuro_wynajmujace (nazwa, Prezes_id) VALUES ('ROBONAJEM', 3);

INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('POGROMCY KURZU', 1);
INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('SPRZATACZE', 2);
INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('TERMINATORZY', 3);
INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('GRUBA SZMATKA', 1);
INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('CZYSCIOCH', 2);
INSERT INTO Firma_sprzatajaca (nazwa, Prezes_id) VALUES ('ROBAL', 3);

INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('NASZ DOM', 1);
INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('NA SWOIM', 2);
INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('SPOLDZIELX', 3);
INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('RAZEM', 1);
INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('WIERNI', 2);
INSERT INTO Spoldzielnia (nazwa, Prezes_id) VALUES ('WIELKA', 3);

-- pracownik -- 

INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Tom', 'Sparkle', 'sprzatacz', 1 , '94030601234');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Wiktor', 'Karrol', 'manager', 1 , '94030601230');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Jan', 'Kos', 'sprzatacz', 2 , '94030601235');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Pawel', 'Bos', 'sprzatacz', 3 , '94030601236');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Wojtek', 'Mis', 'sprzatacz', 4 , '94030601237');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Kasia', 'Dzik', 'sprzatacz', 5 , '94030601238');
INSERT INTO Pracownik (imie, nazwisko, rola, Firma_sprzatajaca_id, pesel) VALUES ('Ania', 'Kot', 'sprzatacz', 6 , '94030601239');

--agent --

INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('John', 'Johnes',  1 , '97030601234');
INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('Romek', 'Kolo',  2 , '97030601235');
INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('Maciek', 'Olo',  3 , '97030601236');
INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('Janek', 'Bobo',  4 , '97030601237');
INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('Asia', 'Wak',  5 , '97030601238');
INSERT INTO Agent (imie, nazwisko,  Biuro_wynajmujace_id, pesel) VALUES ('Marta', 'Eso',  6 , '97030601239');

-- agent to rejon --

INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (1,1);
INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (2,2);
INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (1,3);
INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (1,4);
INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (3,5);
INSERT INTO Agent_to_Rejon (Rejon_id, Agent_id) VALUES (3,6);

--dostepnosc to agent--

INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (1,1);
INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (2,1);
INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (3,2);
INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (4,2);
INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (5,3);
INSERT INTO Dostepnosc_to_Agent (Agent_id, Dostepnosc_id) VALUES (6,3);



--dostepnosc to pracownik--

INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (1,1);
INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (1,2);
INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (2,3);
INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (2,4);
INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (3,5);
INSERT INTO Dostepnosc_to_Pracownik (Dostepnosc_id , Pracownik_id) VALUES (3,6);

--Remont--

INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('malowanie scian','farba niskiej jakosci',1, TO_DATE('2015/01/07', 'yyyy/mm/dd') , 1200.50);
INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('naprawianie parkietu','brak uwag',1, TO_DATE('2015/02/05', 'yyyy/mm/dd') , 1400);
INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('remont lazienki','brak uwag',2, TO_DATE('2015/03/06', 'yyyy/mm/dd') , 1900);
INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('wymiana zalanych kafelkow','brak uwag',3, TO_DATE('2011/06/03', 'yyyy/mm/dd') , 14000);
INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('wymiana uszkodzonej rury','brak uwag',2, TO_DATE('2012/03/05', 'yyyy/mm/dd') , 200);
INSERT INTO Remont (zakres,uwagi,Ekipa_remontowa_id,data_konca,cena) VALUES ('kompleksowa wymiana okien','okna firmy OKNEX',3, TO_DATE('2013/02/09', 'yyyy/mm/dd') , 7000);

--Mieszkanie--
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',1,1,1,1,1800.50, 'Gdansk', 'Piastowska', '30', 'Oliwa');
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',1,2,2,2,1200.00, 'Gdansk', 'Oliwska', '31', 'Oliwa');
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',1,3,3,3,1150.50, 'Gdansk', 'Krzyczowska', '32', 'Wrzeszcz');
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',3,4,4,4,2500.50, 'Gdansk', 'Bitwy Smolenskiej', '33', 'Wrzeszcz');
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',2,5,5,5,3000.50, 'Gdynia', 'Centralna', '39', 'Centum');
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, miasto, ulica, numer, dzielnica) VALUES ('wynajmowane',2,6,6,6,900.50, 'Gdynia', 'Centralna', '55', 'Centum');

-- remont to mieszkanie --


INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (1,1);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (2,1);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (2,3);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (3,4);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (3,6);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (4,4);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (5,1);
INSERT INTO Remont_to_Mieszkanie (Mieszkanie_id , Remont_id) VALUES (6,5);

--wyposazenie --

INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('czajnik','gotowanie wody', 'philips s300',54353, 1);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('lodowka','lodowanie', 'bosch ds300',54352, 2);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('lodowka','lodowanie', 'bosch ds300',54350, 3);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('lodowka','lodowanie', 'bosch ds300',54252, 4);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('sokowirowka','sokowirowanie', 'grundig 2x0',54351, 3);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('pralka','pranie', 'indesit s300',54350, 4);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('odkurzacz','odkurzanie', 'olos s300',54388, 5);
INSERT INTO Wyposazenie (nazwa, przeznaczenie, opis, nr_faktury_zakupu, Mieszkanie_id) VALUES ('piekarnik','pieczenie', 'polski s300',54345, 6);


-- czarna lista --

INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('oszustwo',4);
INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('kradziez',4);
INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('bojki',4);
INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('nieplacenie czynszu',5);
INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('chamstwo',5);
INSERT INTO Czarna_lista (powod, Najemca_id) VALUES ('podnajmowanie mieszkania',5);

--Kontakt--

INSERT INTO Kontakt (telefon, fax ,email, Wynajmujacy_id) VALUES (665213233, '443fd', 'dsds@ds.pl', 1);
INSERT INTO Kontakt (telefon, fax ,email, Wynajmujacy_id) VALUES (665213222, '444fd', 'maupa@ds.pl', 2);
INSERT INTO Kontakt (telefon, fax ,email, Wynajmujacy_id) VALUES (665213211, '445fd', 'witaj@ds.pl', 3);

INSERT INTO Kontakt (telefon, fax ,email, Najemca_id) VALUES (565213211, '44kkk', 'toto@ds.pl', 1);
INSERT INTO Kontakt (telefon, fax ,email, Najemca_id) VALUES (565213222, '44ghg', 'boto@ds.pl', 2);
INSERT INTO Kontakt (telefon, fax ,email, Najemca_id) VALUES (565213299, '44435', 'moro@ds.pl', 3);
INSERT INTO Kontakt (telefon, fax ,email, Najemca_id) VALUES (565213296, '44jjj', 'atto@ds.pl', 4);
INSERT INTO Kontakt (telefon, fax ,email, Najemca_id) VALUES (565213234, '445zz', 'pink@ds.pl', 5);

-- Adres --

INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Wynajmujacy_id) VALUES ('Gdansk','Morska','44','90-543', 1);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Wynajmujacy_id) VALUES ('Gdansk','Norweska','46','97-543', 2);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Wynajmujacy_id) VALUES ('Krakow','Polska','49','43-543', 3);

INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Najemca_id) VALUES ('Bydgoszcz','Polska','55','90-543', 1);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Najemca_id) VALUES ('Grajewo','Japonska','55','33-242', 2);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Najemca_id) VALUES ('Malo','Szwedzka','55','76-424', 3);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Najemca_id) VALUES ('Ameryka','Uli','45','90-522', 4);
INSERT INTO Adres (miasto, ulica, numer, kod_pocztowy, Najemca_id) VALUES ('Torun','Baltycka','55','50-993', 5);

--WYNAJEM--
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa prawna',1,1);
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa slowna',2,2);
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa prawna',2,3);
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa prawna',3,4);
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa slowna',4,5);
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('umowa slowna',5,1);

--Wplaty--
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1100,1);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1300,1);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1800,2);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',5000,3);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',650.50,4);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',700,4);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',2000,5);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1000,6);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1000,6);
INSERT INTO Wplaty (waluta,suma, Wynajem_id) VALUES ('PLN',1900,6);

--Data--

INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/05/05', 'yyyy/mm/dd') , 'Okres 1', 1);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/08/01', 'yyyy/mm/dd') , TO_DATE('2019/05/05', 'yyyy/mm/dd') , 'Okres 2', 1);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/12/01', 'yyyy/mm/dd') , 'Okres pelny', 2);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/07/05', 'yyyy/mm/dd') , 'Okres pelny', 3);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/05/09', 'yyyy/mm/dd') , 'Okres pelny', 4);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/09/05', 'yyyy/mm/dd') , 'Okres pelny', 5);
INSERT INTO Data (poczatek, koniec, okres, Wynajem_id) VALUES (TO_DATE('2018/01/01', 'yyyy/mm/dd') , TO_DATE('2018/11/05', 'yyyy/mm/dd') , 'Okres pelny', 6);

