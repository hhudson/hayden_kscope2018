create or replace package sample_data_pkg as
  function varchar2_to_blob(p_varchar2_tab in dbms_sql.varchar2_table) return blob;
  procedure delete_data;
  procedure insert_data;
end sample_data_pkg;
/
