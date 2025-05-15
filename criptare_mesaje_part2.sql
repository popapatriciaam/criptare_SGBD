set serveroutput on
create or replace procedure citeste_mesaje (
  p_utilizator_id in number
) as
  l_key raw(32) := utl_raw.cast_to_raw('12345678901234567890123456789012');
  l_decrypted varchar2(2000);
begin
  for msg in (
    select m.id_mesaj, u.username as expeditor, m.continut_criptat
    from mesaje m
    join utilizatori u on m.id_expeditor = u.id_utilizator
    where m.id_destinatar = p_utilizator_id
  ) loop
    l_decrypted := utl_raw.cast_to_varchar2(
      dbms_crypto.decrypt(
        src => msg.continut_criptat,
        typ => dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5,
        key => l_key
      )
    );

    dbms_output.put_line('de la: ' || msg.expeditor || ' | mesaj: ' || l_decrypted);
  end loop;
end;

select * from utilizatori;

execute trimite_mesaj(916,128,'bea-ti cafeaua!!');
select * from mesaje;


execute trimite_mesaj(916,128,'bea-ti cafeauaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fai!!');

execute trimite_mesaj(916,128,'hai sa bem!');
execute trimite_mesaj(128,916,'nu aveau pepsi zero twist la mega :(');

execute citeste_mesaje(128);
execute citeste_mesaje(916);


create or replace procedure adauga_utilizator(p_username in varchar2) as
    v_id number;
begin
    select nvl(max(id_utilizator), 0) + 1 into v_id from utilizatori;

    insert into utilizatori(id_utilizator, username)
    values (v_id, p_username);
    
    dbms_output.put_line('Utilizator adaugat cu id: ' || v_id);
exception
    when dup_val_on_index then
        raise_application_error(-20001, 'Username-ul exista deja.');
end;

create or replace procedure verifica_utilizator(
    p_username in varchar2,
    p_id out number
) as
begin
    select id_utilizator into p_id
    from utilizatori
    where username = p_username;
exception
    when no_data_found then
        p_id := -1;
end;


execute adauga_utilizator('ciumpalaca');

declare
    i number;
begin
    verifica_utilizator('patricia_p',i);
    dbms_output.put_line(i);
end;

