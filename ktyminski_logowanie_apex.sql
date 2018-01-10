CREATE TABLE konto (
    id        INTEGER NOT NULL,
    login     VARCHAR2(50) NOT NULL,
    haslo     VARCHAR2(100) NOT NULL,
    rola_id   INTEGER NOT NULL
);

COMMENT ON TABLE konto IS
    'Tabela konto';

ALTER TABLE konto ADD CONSTRAINT uzytkownik_pk PRIMARY KEY ( id );

ALTER TABLE konto ADD CONSTRAINT uzytkownik__un UNIQUE ( login );

CREATE SEQUENCE konto_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER konto_id_trg BEFORE
    INSERT ON konto
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := konto_id_seq.nextval;
END;
/

INSERT INTO konto VALUES(1,'admin','admin',1);
INSERT INTO konto VALUES(2,'user','user',2);
/