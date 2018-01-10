-- funkcja 1

CREATE OR REPLACE FUNCTION czy_zaufana_ekipa
(v_id in EKIPA_REMONTOWA.id%TYPE)
RETURN BOOLEAN IS
v_ilosc_remontow NUMBER:=0;
BEGIN
 SELECT COUNT(*) INTO v_ilosc_remontow
 FROM REMONT WHERE EKIPA_REMONTOWA_ID=v_id;
 IF v_ilosc_remontow >= 3 THEN
     RETURN TRUE;
  ELSE
     RETURN FALSE;
 END IF;
END;
/
-- Przypadek testowy, patrzymy ile razy najmoalismy ekipe, jesli wiecej lub tyle samo co 3 to jest ona zaufana
BEGIN
    IF (czy_zaufana_ekipa(2)) THEN
        DBMS_OUTPUT.PUT_LINE('ekipa jest zaufana');
    ELSE
        DBMS_OUTPUT.PUT_LINE('jeszcze nie wierzymy ekipie');
    END IF;
 
END;
/

--funkcja 2

CREATE OR REPLACE FUNCTION ile_biznesow
(v_id in PREZES.id%TYPE)
RETURN varchar2 IS
v_biznesy_spoldzielnie NUMBER:=0;
v_biznesy_sprzatajace NUMBER:=0;
v_biznesy_agencje NUMBER:=0;
v_szef_nazwisko VARCHAR2(50):='';
BEGIN
 SELECT nazwisko INTO v_szef_nazwisko FROM PREZES WHERE id=v_id;
 SELECT COUNT(*) INTO v_biznesy_spoldzielnie
 FROM SPOLDZIELNIA WHERE PREZES_ID=v_id;
 SELECT COUNT(*) INTO v_biznesy_sprzatajace
 FROM FIRMA_SPRZATAJACA WHERE PREZES_ID=v_id;
 SELECT COUNT(*) INTO v_biznesy_agencje
 FROM BIURO_WYNAJMUJACE WHERE PREZES_ID=v_id;
 
 RETURN 'szef ' || v_szef_nazwisko || ' prowadzi biznesow: ' || TO_CHAR(v_biznesy_spoldzielnie + v_biznesy_sprzatajace + v_biznesy_agencje) ||  '. spoldzielnie: ' || v_biznesy_spoldzielnie ||' sprzatacze: ' || v_biznesy_sprzatajace || ' agencje: ' || v_biznesy_agencje;
END;
/
-- Przypadek testowy, patrzymy ile kazdy z szefow prowadzi roznych biznesow
BEGIN  
        DBMS_OUTPUT.PUT_LINE(ile_biznesow(2));
END;
/

--funkcja 3

CREATE OR REPLACE FUNCTION czy_mieszkanie_drogie
(v_id in MIESZKANIE.id%TYPE)
RETURN varchar2 IS
v_cena NUMBER;
v_srednia NUMBER;
v_komunikat VARCHAR2(40);
BEGIN
SELECT cena INTO v_cena FROM Mieszkanie WHERE id=v_id;
SELECT AVG(cena) INTO v_srednia FROM ( SELECT cena FROM Mieszkanie);
 
 RETURN 'CENA TO ' || v_cena || ' A srednia to ' || v_srednia;
END;
/
-- Przypadek testowy, sprawdzamy czy mieszkanie jest drozsze od sredniej czy tansze
BEGIN  
        DBMS_OUTPUT.PUT_LINE(czy_mieszkanie_drogie(2));
END;
/

--funkcja 4

CREATE OR REPLACE FUNCTION czy_pesel_poprawny
(v_id in NAJEMCA.id%TYPE)
RETURN BOOLEAN
IS
v_pesel VARCHAR2(11);
BEGIN
   SELECT pesel INTO v_pesel FROM NAJEMCA WHERE id=v_id;
   IF(LENGTH(v_pesel) = 11 ) THEN
       IF (SUBSTR(v_pesel,1,1) IN ('1','2','3','4','5','6','7','8','9') 
        AND SUBSTR(v_pesel,2,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,3,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,4,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,5,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,6,1) IN ('1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,7,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,8,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,9,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,10,1) IN ('0','1','2','3','4','5','6','7','8','9')
        AND SUBSTR(v_pesel,11,1) IN ('0','1','2','3','4','5','6','7','8','9')  
      ) THEN
          RETURN true;
      ELSE
          RETURN false;
  END IF;
 END IF;
END;
/
-- Przypadek testowy, sprawdzamy czy pesel NAJEMCY jest poprawny
BEGIN  
        IF (czy_pesel_poprawny(2)) THEN
             DBMS_OUTPUT.PUT_LINE('POPRAWNY');
        ELSE
             DBMS_OUTPUT.PUT_LINE('NIEPOPRAWNY');
        END IF;
END;
/


--funkcja 5

CREATE OR REPLACE FUNCTION daj_najwieksza_wplate
RETURN varchar2 IS
v_maks NUMBER;
BEGIN

SELECT MAX(suma) INTO v_maks FROM ( SELECT suma FROM Wplaty);
 
 RETURN v_maks;
END;
/
-- Przypadek testowy, chcemy zobaczyc ile wynosila najwieksza wplata na nasze konto
BEGIN  
        DBMS_OUTPUT.PUT_LINE('najwieksza wplata to' + daj_najwieksza_wplate);
END;
/


