-- procedura 1

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE podwyzka_cen 
( v_procent IN NUMBER )IS
BEGIN
 UPDATE MIESZKANIE
 SET cena=cena*(1+v_procent/100);
END;
/
-- przypadek testowy, podnosimy ceny wszystkich mieszkan bo kryzys :(
BEGIN
    podwyzka_cen(10);
END;
/

SELECT * FROM Mieszkanie;

-- procedura 2

CREATE OR REPLACE PROCEDURE kto_dzis_pracuje 
( v_pracuje IN dostepnosc.dzien%TYPE )IS
v_rekord_p   pracownik%rowtype;
v_rekord_a agent%rowtype;
v_liczba_sprzataczy NUMBER;
v_liczba_agentow NUMBER;
v_dzien_id NUMBER;
CURSOR Dostepnosc_to_pracownik_curs IS SELECT * FROM Dostepnosc_to_pracownik;
CURSOR Dostepnosc_to_agent_curs IS SELECT * FROM Dostepnosc_to_agent;

BEGIN
 SELECT id INTO v_dzien_id FROM Dostepnosc WHERE dzien=v_pracuje;
 
  DBMS_OUTPUT.PUT_LINE('Dzis pracuja sprzatacze:');
 
 FOR v_rekord IN Dostepnosc_to_pracownik_curs LOOP
    IF (v_rekord.Dostepnosc_id = v_dzien_id) THEN
        SELECT * INTO v_rekord_p FROM PRACOWNIK WHERE id=v_rekord.Pracownik_id;
        DBMS_OUTPUT.PUT_LINE(v_rekord_p.nazwisko || ' ' || v_rekord_p.nazwisko);
    END IF;
 END LOOP;

   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE('Dzis pracuja agenci:');
   
 FOR v_rekord IN Dostepnosc_to_agent_curs LOOP
    IF (v_rekord.Dostepnosc_id = v_dzien_id) THEN
        SELECT * INTO v_rekord_a FROM agent WHERE id=v_rekord.agent_id;
        DBMS_OUTPUT.PUT_LINE(v_rekord_a.nazwisko || ' ' || v_rekord_p.nazwisko);
    END IF;
    
 END LOOP;
END;
/

BEGIN
    kto_dzis_pracuje(TO_DATE('2018/01/07', 'yyyy/mm/dd'));
    --ewentualnie zamiast '2018/01/09 to sysdate
END;
/

-- procedura 3

CREATE OR REPLACE PROCEDURE czy_jest_uregulowany 
( v_wynajem_id IN WPLATY.wynajem_id%TYPE )IS
 v_razem_cena NUMBER;
 v_ilosc_wplat NUMBER;
 v_mieszkanie_id NUMBER;
 v_cena_mieszkanie NUMBER;
BEGIN
   SELECT COUNT(*)INTO v_ilosc_wplat FROM WPLATY WHERE Wynajem_id=v_wynajem_id;
   SELECT SUM(suma)INTO v_razem_cena FROM WPLATY WHERE Wynajem_id=v_wynajem_id;
   
   SELECT Mieszkanie_id INTO v_mieszkanie_id FROM WYNAJEM WHERE id=v_wynajem_id;
   SELECT cena INTO v_cena_mieszkanie FROM MIESZKANIE WHERE ID=v_mieszkanie_id;
   
   DBMS_OUTPUT.PUT_LINE('Cena wplacona przez najemce ' || v_razem_cena);
   DBMS_OUTPUT.PUT_LINE('Cena do zaplacenia ' || ROUND(v_ilosc_wplat*v_cena_mieszkanie,2));
   
END;
/

-- procedura sprawdza ile powinien wplacic juz najemca, a ile wplacil we wszystkich przelewach.
BEGIN
    czy_jest_uregulowany(1);
END;
/

-- procedura 4

CREATE OR REPLACE PROCEDURE kod_pocztowy IS
 CURSOR adres_curs IS SELECT * FROM Adres;
BEGIN
  For v_zmienna IN adres_curs LOOP
    IF(LENGTH(v_zmienna.kod_pocztowy) != 6) THEN
        dbms_output.put_line(LENGTH(v_zmienna.kod_pocztowy));
        UPDATE Adres SET kod_pocztowy = SUBSTR(v_zmienna.kod_pocztowy,1,2)||'-'||SUBSTR(v_zmienna.kod_pocztowy,3,3) WHERE id = v_zmienna.id;
    END IF;
  END LOOP;
   
END;
/

-- procedura podmienia kody pocztowe, ktore maja 5 cyfr zamiast 6 z myslnikiem
BEGIN
    kod_pocztowy;
END;
/

SELECT * FROM ADRES;

--procedura 5

CREATE OR REPLACE PROCEDURE jak_dlugi_wynajem 
(v_id in Data.id%TYPE) IS
v_start DATE;
v_koniec DATE;
 
BEGIN
   SELECT poczatek INTO v_start FROM Data WHERE id=v_id;
   SELECT koniec INTO v_koniec FROM Data WHERE id=v_id;
   
   DBMS_OUTPUT.PUT_LINE(v_koniec-v_start);
   
END;
/

-- Oblicza na ile dni mieszkanie wynajmuje klient, uzyteczne bo nie musimy sie zastanawiac
-- ktory miesiac ma ile dni.
BEGIN
    jak_dlugi_wynajem(32);
END;
/
--
--SELECT * FROM DATA;



