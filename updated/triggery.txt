-- trigger 1 
CREATE OR REPLACE TRIGGER insert_miasto_trg
BEFORE INSERT ON MIESZKANIE FOR EACH ROW
BEGIN

DBMS_OUTPUT.PUT_LINE(LENGTH(:new.ulica));
 IF (:new.miasto is NULL)THEN
    :new.miasto:='Gdansk';
 END IF;
END;
/
-- jak nie podamy nazwy miasta to domyslnie ustawia sie na glowny adres, gdansk.
INSERT INTO Mieszkanie (status, Wynajmujacy_id, Spoldzielnia_id, Firma_sprzatajaca_id, Biuro_wynajmujace_id, cena, ulica, numer, dzielnica) VALUES ('wynajmowane',1,1,1,1,1800.50, 'Piastowska', '30', 'Oliwa');

SELECT * FROM Mieszkanie;

--trigger 2
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER insert_umowa_trg
BEFORE INSERT ON WYNAJEM FOR EACH ROW
BEGIN

 IF (:new.umowa is NULL)THEN
    :new.umowa:=UPPER('umowa nieustalona');
 END IF;
END;
/
-- jak nie podamy umowy to chcemy zaznaczyc ze umowa zostala nieustalona
INSERT INTO Wynajem (umowa, Mieszkanie_id, Najemca_id) VALUES ('',1,1);
SELECT * FROM Wynajem;

--trigger 3
CREATE OR REPLACE TRIGGER ekipa_trg
    BEFORE INSERT OR UPDATE OF liczebnosc ON Ekipa_remontowa
    FOR EACH ROW
BEGIN
    IF (:new.liczebnosc < 1  
         OR :new.liczebnosc > 100)
    THEN
        raise_application_error(-20000
                , 'Ekipa nie moze liczyc mniej niz 0 ani wiecej niz 100 osob.');
    END IF;
END;
/
-- trigger nie pozwala dodac ekipy_remontowej ktorej liczebnosc jest mniejsza niz 1 i wieksza niz 100
INSERT INTO Ekipa_remontowa (liczebnosc, nazwa) VALUES (3, 'REMONTEX');
SELECT * FROM Ekipa_remontowa;

--trigger 4

CREATE TABLE dawne_adresy(id INT, miasto VARCHAR2(32), ulica VARCHAR2(32), numer VARCHAR2(10), najemca_ID NUMBER(11), wynajmujacy_ID NUMBER(11), data DATE);

CREATE OR REPLACE TRIGGER dawne_adresy_trg
BEFORE DELETE ON adres
FOR EACH ROW
BEGIN
IF DELETING THEN
INSERT INTO dawne_adresy VALUES (:old.id, :old.miasto , :old.ulica, :old.numer,:old.najemca_id,:old.wynajmujacy_id, SYSDATE());
 END IF;
  
END;
/
-- po usunieciu adresu dodajemy go do dawnych adresow, dodatkowej tabeli
DELETE FROM adres WHERE id=10;
SELECT * FROM dawne_adresy;

--trigger 5
CREATE OR REPLACE TRIGGER czarna_lista_id_trg
    BEFORE INSERT OR UPDATE OF Najemca_id ON Czarna_lista
    FOR EACH ROW
BEGIN
    DECLARE 
    v_zmm NUMBER(11);
    BEGIN
       
        SELECT Count(*) INTO v_zmm FROM Najemca WHERE id=:new.Najemca_id;
         DBMS_OUTPUT.PUT_LINE(v_zmm);
        IF (v_zmm = 0)
        THEN
            raise_application_error(-20000
                    , 'Nie ma takiego najemcy.');
        END IF;
    END;
END;
/
-- trigger nie pozwala dodac do czarnej listy najemcy, ktory nie istnieje w tabeli najemca
INSERT INTO Czarna_lista (id , powod, Najemca_id) VALUES (23, 'oszustwo',2);
SELECT * FROM Czarna_lista;





