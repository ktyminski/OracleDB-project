CREATE OR REPLACE PACKAGE pakiet IS

     PROCEDURE podwyzka_cen ( v_procent IN NUMBER );
     PROCEDURE kto_dzis_pracuje( v_pracuje IN dostepnosc.dzien%TYPE );
     PROCEDURE czy_jest_uregulowany( v_wynajem_id IN WPLATY.wynajem_id%TYPE );
     PROCEDURE kod_pocztowy;
     PROCEDURE jak_dlugi_wynajem(v_id in Data.id%TYPE);
    
    
    FUNCTION czy_zaufana_ekipa(v_id in EKIPA_REMONTOWA.id%TYPE) RETURN BOOLEAN ;
    FUNCTION czy_zaufana_ekipa RETURN BOOLEAN; --do przeciazenia, nie zaglebialem sie w fajna funkcjonalnosc, a sama technike przeciazenia.
    FUNCTION czy_pesel_poprawny(v_id in NAJEMCA.id%TYPE) RETURN BOOLEAN;
    FUNCTION ile_biznesow(v_id in PREZES.id%TYPE) RETURN varchar2;
    FUNCTION czy_mieszkanie_drogie(v_id in MIESZKANIE.id%TYPE) RETURN VARCHAR2;
    FUNCTION daj_najwieksza_wplate RETURN VARCHAR2;
 
END pakiet;
/

CREATE OR REPLACE PACKAGE BODY pakiet IS
            
     PROCEDURE kto_dzis_pracuje 
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
        
        PROCEDURE czy_jest_uregulowany 
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



          PROCEDURE podwyzka_cen 
        ( v_procent IN NUMBER )IS
        BEGIN
         UPDATE MIESZKANIE
         SET cena=cena*(1+v_procent/100);
        END;


        
        PROCEDURE kod_pocztowy IS
         CURSOR adres_curs IS SELECT * FROM Adres;
        BEGIN
          For v_zmienna IN adres_curs LOOP
            IF(LENGTH(v_zmienna.kod_pocztowy) != 6) THEN
                dbms_output.put_line(LENGTH(v_zmienna.kod_pocztowy));
                UPDATE Adres SET kod_pocztowy = SUBSTR(v_zmienna.kod_pocztowy,1,2)||'-'||SUBSTR(v_zmienna.kod_pocztowy,3,3) WHERE id = v_zmienna.id;
            END IF;
          END LOOP;
           
        END;

        PROCEDURE jak_dlugi_wynajem 
        (v_id in Data.id%TYPE) IS
        v_start DATE;
        v_koniec DATE;
         
        BEGIN
           SELECT poczatek INTO v_start FROM Data WHERE id=v_id;
           SELECT koniec INTO v_koniec FROM Data WHERE id=v_id;
           
           DBMS_OUTPUT.PUT_LINE(v_koniec-v_start);
           
        END;
        
        FUNCTION czy_zaufana_ekipa
        (v_id in EKIPA_REMONTOWA.id%TYPE)
        RETURN BOOLEAN IS
        v_ilosc_remontow NUMBER:=0;
        BEGIN
         SELECT COUNT(*) INTO v_ilosc_remontow
         FROM REMONT WHERE EKIPA_REMONTOWA_ID=v_id;
         IF v_ilosc_remontow >= 1 THEN
             RETURN TRUE;
          ELSE
             RETURN FALSE;
         END IF;
        END;
        
        FUNCTION czy_zaufana_ekipa
        RETURN BOOLEAN IS
        v_ilosc_remontow NUMBER:=0;
        BEGIN   
          RETURN FALSE;
        END;
        
        FUNCTION ile_biznesow
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
            
        FUNCTION czy_mieszkanie_drogie
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
            
            FUNCTION czy_pesel_poprawny
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
            
        FUNCTION daj_najwieksza_wplate
        RETURN varchar2 IS
        v_maks NUMBER;
        BEGIN
        
        SELECT MAX(suma) INTO v_maks FROM ( SELECT suma FROM Wplaty);
         
         RETURN v_maks;
        END;



 END pakiet;
/
SET SERVEROUTPUT ON 
/
--Wywolujemy skladowe pakietu - sposob 1
BEGIN
    --przyklad przeciazenia funkcji, w 1 nigdy nie wejdzie do ifa bo zawsze zwraca false.
    IF(pakiet.czy_zaufana_ekipa) THEN
        DBMS_OUTPUT.PUT_LINE('to i tak sie nie wyswietli');
    END IF;
    
    IF(pakiet.czy_zaufana_ekipa(1)) THEN
        DBMS_OUTPUT.PUT_LINE('zaufana');
    END IF;

NULL;
END;
/