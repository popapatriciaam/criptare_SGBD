set serveroutput on

--tabela utilizatori
create table Utilizatori
( 
    id_utilizator number(3) primary key,
    username varchar2(255) unique not null
);

--tabela Mesaje
create table Mesaje
(
    id_mesaj number(3) primary key,
    id_expeditor number(3),
    id_destinatar number(3), --check
    continut_criptat raw(2000),
    data_mesajului date,
    
    constraint fk_exp foreign key (id_expeditor) references Utilizatori(id_utilizator) on delete set null,
    constraint fk_dest foreign key (id_destinatar) references Utilizatori(id_utilizator) on delete set null,
    constraint chk_dest check (id_destinatar != id_expeditor) 
);

insert into utilizatori
values (916, 'andreea_p');

insert into utilizatori
values (128, 'patricia_p');





select * from utilizatori;

create sequence mesaje_id
start with 1
increment by 1 
minvalue 1
maxvalue 1000
nocycle;


--procedura trimite_mesaj

create or replace procedure trimite_mesaj
(  p_id_expeditor in number,
    p_id_destinatar in number,
    mesaj in varchar2 )
as
    v_mesaj_raw raw(2000);
    v_key raw(32) := utl_raw.cast_to_raw('12345678901234567890123456789012');
    v_encrypt raw(2000);
    
begin

    if p_id_expeditor = p_id_destinatar then
        raise_application_error(-20001, 'Nu po?i trimite un mesaj c�tre tine �nsu?i!');
    end if;
    v_mesaj_raw := utl_raw.cast_to_raw(mesaj);
    
    v_encrypt := dbms_crypto.encrypt (
        src => v_mesaj_raw,
        typ => dbms_crypto.encrypt_AES256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5,
        key => v_key);
        
    insert into mesaje
    values (mesaje_id.nextval, p_id_expeditor, p_id_destinatar,v_encrypt,sysdate);
        
end;




