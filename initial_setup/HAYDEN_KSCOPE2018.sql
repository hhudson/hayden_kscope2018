set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>492018
);
end;
/
prompt  WORKSPACE 492018
--
-- Workspace, User Group, User, and Team Development Export:
--   Date and Time:   07:55 Thursday April 12, 2018
--   Exported By:     HAYDEN
--   Export Type:     Workspace Export
--   Version:         5.1.3.00.05
--   Instance ID:     108840466845548
--
-- Import:
--   Using Instance Administration / Manage Workspaces
--   or
--   Using SQL*Plus as the Oracle user APEX_050100
 
begin
    wwv_flow_api.set_security_group_id(p_security_group_id=>492018);
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API creates only the meta data for this APEX workspace
prompt  Creating workspace HAYDEN_KSCOPE2018...
begin
wwv_flow_fnd_user_api.create_company (
  p_id => 48224498381406602
 ,p_provisioning_company_id => 492018
 ,p_short_name => 'HAYDEN_KSCOPE2018'
 ,p_display_name => 'HAYDEN_KSCOPE2018'
 ,p_first_schema_provisioned => 'HAYDEN_KSCOPE2018'
 ,p_company_schemas => 'HAYDEN_KSCOPE2018'
 ,p_ws_schema => 'HAYDEN_KSCOPE2018'
 ,p_account_status => 'ASSIGNED'
 ,p_allow_plsql_editing => 'Y'
 ,p_allow_app_building_yn => 'Y'
 ,p_allow_packaged_app_ins_yn => 'Y'
 ,p_allow_sql_workshop_yn => 'Y'
 ,p_allow_websheet_dev_yn => 'Y'
 ,p_allow_team_development_yn => 'Y'
 ,p_allow_to_be_purged_yn => 'Y'
 ,p_allow_restful_services_yn => 'Y'
 ,p_source_identifier => 'HAYDEN_K'
 ,p_path_prefix => 'HAYDEN_KSCOPE2018'
 ,p_files_version => 1
);
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
begin
wwv_flow_api.create_user_groups (
  p_id => 1670338847171665,
  p_GROUP_NAME => 'OAuth2 Client Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to register OAuth2 Client Applications');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 1670236590171665,
  p_GROUP_NAME => 'RESTful Services',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use RESTful Services with this workspace');
end;
/
begin
wwv_flow_api.create_user_groups (
  p_id => 1670163835171662,
  p_GROUP_NAME => 'SQL Developer',
  p_SECURITY_GROUP_ID => 10,
  p_GROUP_DESC => 'Users authorized to use SQL Developer with this workspace');
end;
/
prompt  Creating group grants...
----------------
-- U S E R S
-- User repository for use with APEX cookie-based authentication.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id                      => '48224268407406156',
  p_user_name                    => 'HAYDEN',
  p_first_name                   => 'Hayden',
  p_last_name                    => 'Hudson',
  p_description                  => '',
  p_email_address                => 'hayden.hudson@concept2completion.com',
  p_web_password                 => '7C1D4EC480066631ACBD22F642A0DCBF08B47431B6BDA63B82B35C2AA1DB7D7EE1FEF9782CD2EABBFA4AD791584F88C2FFC8DD2C8C59767187EFA3D6604B5286',
  p_web_password_format          => '5;5;10000',
  p_group_ids                    => '',
  p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema               => 'HAYDEN_KSCOPE2018',
  p_account_locked               => 'N',
  p_account_expiry               => to_date('201804092138','YYYYMMDDHH24MI'),
  p_failed_access_attempts       => 1,
  p_change_password_on_first_use => 'N',
  p_first_password_use_occurred  => 'Y',
  p_allow_app_building_yn        => 'Y',
  p_allow_sql_workshop_yn        => 'Y',
  p_allow_websheet_dev_yn        => 'Y',
  p_allow_team_development_yn    => 'Y',
  p_allow_access_to_schemas      => '');
end;
/
----------------
--App Builder Preferences
--
----------------
--Click Count Logs
--
----------------
--csv data loading
--
----------------
--mail
--
----------------
--mail log
--
----------------
--app models
--
----------------
--password history
--
begin
  wwv_flow_api.create_password_history (
    p_id => 48224575366406663,
    p_user_id => 48224268407406156,
    p_password => 'EB8D3EA5CF2134DF8CB7A2CEEFBCA8D57D5A4F9CE7E5BF07EB7BF12EB2198EA08A02F5EDAE961BED7781FB884C90603F70ED1BB4E8A3D9A933A2328F128B0336');
end;
/
begin
  wwv_flow_api.create_password_history (
    p_id => 48243408321414856,
    p_user_id => 48224268407406156,
    p_password => '7C1D4EC480066631ACBD22F642A0DCBF08B47431B6BDA63B82B35C2AA1DB7D7EE1FEF9782CD2EABBFA4AD791584F88C2FFC8DD2C8C59767187EFA3D6604B5286');
end;
/
----------------
--preferences
--
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48244186724425245,
    p_user_id => 'HAYDEN',
    p_preference_name => 'FB_FLOW_ID',
    p_attribute_value => '130');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48397137554584296,
    p_user_id => 'HAYDEN',
    p_preference_name => 'FSP_IR_4000_P1500_W3519715528105919',
    p_attribute_value => '3521529006112497____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48244029991425230,
    p_user_id => 'HAYDEN',
    p_preference_name => 'FSP_IR_4000_P1_W3326806401130228',
    p_attribute_value => '3328003692130542____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48243805619425222,
    p_user_id => 'HAYDEN',
    p_preference_name => 'PERSISTENT_ITEM_P1_DISPLAY_MODE',
    p_attribute_value => 'ICONS');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48244340183425658,
    p_user_id => 'HAYDEN',
    p_preference_name => 'FSP_IR_4000_P801_W47918412797645641',
    p_attribute_value => '47921608032702994____');
end;
/
begin
  wwv_flow_api.create_preferences$ (
    p_id => 48244744110431307,
    p_user_id => 'HAYDEN',
    p_preference_name => 'FSP_IR_4000_P473_W12979631587497157',
    p_attribute_value => '12983410815532326____');
end;
/
----------------
--query builder
--
----------------
--sql scripts
--
----------------
--sql commands
--
----------------
--user access log
--
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'HAYDEN',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_050100',
    p_access_date => to_date('201804092139','YYYYMMDDHH24MI'),
    p_ip_address => '65.96.174.57',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'HAYDEN',
    p_auth_method => 'Application Express Accounts',
    p_app => 130,
    p_owner => 'HAYDEN_KSCOPE2018',
    p_access_date => to_date('201804092140','YYYYMMDDHH24MI'),
    p_ip_address => '65.96.174.57',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 4,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'HAYDEN',
    p_auth_method => 'Application Express Accounts',
    p_app => 130,
    p_owner => 'HAYDEN_KSCOPE2018',
    p_access_date => to_date('201804112133','YYYYMMDDHH24MI'),
    p_ip_address => '65.96.174.57',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 4,
    p_custom_status_text => 'Invalid Login Credentials');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'HAYDEN',
    p_auth_method => 'Internal Authentication',
    p_app => 4500,
    p_owner => 'APEX_050100',
    p_access_date => to_date('201804112120','YYYYMMDDHH24MI'),
    p_ip_address => '65.96.174.57',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
begin
  wwv_flow_api.create_user_access_log1$ (
    p_login_name => 'HAYDEN',
    p_auth_method => 'Application Express Accounts',
    p_app => 130,
    p_owner => 'HAYDEN_KSCOPE2018',
    p_access_date => to_date('201804092140','YYYYMMDDHH24MI'),
    p_ip_address => '65.96.174.57',
    p_remote_user => 'APEX_PUBLIC_USER',
    p_auth_result => 0,
    p_custom_status_text => '');
end;
/
 
prompt ...RESTful Services
 
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(48224807618406790)
,p_name=>'oracle.example.hr'
);
 
end;
/
prompt --application/restful_services/oracle_example_hr
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(48224807618406790)
,p_name=>'oracle.example.hr'
,p_uri_prefix=>'hr/'
,p_parsing_schema=>'HAYDEN_KSCOPE2018'
,p_items_per_page=>10
,p_status=>'PUBLISHED'
,p_row_version_number=>22
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48226830295406864)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'empinfo/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48226984723406864)
,p_template_id=>wwv_flow_api.id(48226830295406864)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>'select * from emp'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48225163653406858)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'employees/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48225238055406858)
,p_template_id=>wwv_flow_api.id(48225163653406858)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_items_per_page=>7
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno',
'  from (',
'       select emp.*',
'            , row_number() over (order by empno) rn',
'         from emp',
'       ) tmp'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48225342300406858)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'employees/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48225430813406858)
,p_template_id=>wwv_flow_api.id(48225342300406858)
,p_source_type=>'QUERY_1_ROW'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from emp',
' where empno = :id'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(48225526644406861)
,p_handler_id=>wwv_flow_api.id(48225430813406858)
,p_name=>'ID'
,p_bind_variable_name=>'ID'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48225661912406863)
,p_template_id=>wwv_flow_api.id(48225342300406858)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'PUT'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno',
'    where empno = :id;',
'    :status := 200;',
'    :location := :id;',
'exception',
'    when others then',
'        :status := 400;',
'end;'))
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(48225743049406863)
,p_handler_id=>wwv_flow_api.id(48225661912406863)
,p_name=>'ID'
,p_bind_variable_name=>'ID'
,p_source_type=>'HEADER'
,p_access_method=>'IN'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(48225937472406863)
,p_handler_id=>wwv_flow_api.id(48225661912406863)
,p_name=>'X-APEX-FORWARD'
,p_bind_variable_name=>'location'
,p_source_type=>'HEADER'
,p_access_method=>'OUT'
,p_param_type=>'STRING'
);
wwv_flow_api.create_restful_param(
 p_id=>wwv_flow_api.id(48225882448406863)
,p_handler_id=>wwv_flow_api.id(48225661912406863)
,p_name=>'X-APEX-STATUS-CODE'
,p_bind_variable_name=>'status'
,p_source_type=>'HEADER'
,p_access_method=>'OUT'
,p_param_type=>'INT'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48226018204406863)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'employeesfeed/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48226119618406863)
,p_template_id=>wwv_flow_api.id(48226018204406863)
,p_source_type=>'FEED'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_items_per_page=>25
,p_require_https=>'NO'
,p_source=>'select empno, ename from emp order by deptno, ename'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48226214527406863)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'employeesfeed/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48226359174406863)
,p_template_id=>wwv_flow_api.id(48226214527406863)
,p_source_type=>'QUERY'
,p_format=>'CSV'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>'select * from emp where empno = :id'
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48226406791406863)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'empsec/{empname}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48226518236406863)
,p_template_id=>wwv_flow_api.id(48226406791406863)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select empno, ename, deptno, job from emp ',
'	where ((select job from emp where ename = :empname) IN (''PRESIDENT'', ''MANAGER'')) ',
'    OR  ',
'    (deptno = (select deptno from emp where ename = :empname)) ',
'order by deptno, ename',
''))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48226652687406863)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'empsecformat/{empname}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48226738797406864)
,p_template_id=>wwv_flow_api.id(48226652687406863)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  prevdeptno     number;',
'  total_rows     number;',
'  deptloc        varchar2(20);',
'  deptname       varchar2(20);',
'  ',
'  CURSOR         getemps is select * from emp ',
'                             start with ename = :empname',
'                           connect by prior empno = mgr',
'                             order siblings by deptno, ename;',
'BEGIN',
'  sys.htp.htmlopen;',
'  sys.htp.headopen;',
'  sys.htp.title(''Hierarchical Department Report for Employee ''||apex_escape.html(:empname));',
'  sys.htp.headclose;',
'  sys.htp.bodyopen;',
' ',
'  for l_employee in getemps ',
'  loop',
'      if l_employee.deptno != prevdeptno or prevdeptno is null then',
'          select dname, loc ',
'            into deptname, deptloc ',
'            from dept ',
'           where deptno = l_employee.deptno;',
'           ',
'          if prevdeptno is not null then',
'              sys.htp.print(''</ul>'');',
'          end if;',
'',
'          sys.htp.print(''Department '' || apex_escape.html(deptname) || '' located in '' || apex_escape.html(deptloc) || ''<p/>'');',
'          sys.htp.print(''<ul>'');',
'      end if;',
'',
'      sys.htp.print(''<li>'' || apex_escape.html(l_employee.ename) || '', ''  || apex_escape.html(l_employee.empno) || '', '' || ',
'                        apex_escape.html(l_employee.job) || '', '' || apex_escape.html(l_employee.sal) || ''</li>'');',
'',
'      prevdeptno := l_employee.deptno;',
'      total_rows := getemps%ROWCOUNT;',
'      ',
'  end loop;',
'',
'  if total_rows > 0 then',
'      sys.htp.print(''</ul>'');',
'  end if;',
'',
'  sys.htp.bodyclose;',
'  sys.htp.htmlclose;',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(48224990644406824)
,p_module_id=>wwv_flow_api.id(48224807618406790)
,p_uri_template=>'version/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(48225094395406854)
,p_template_id=>wwv_flow_api.id(48224990644406824)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sys.htp.p( ''{ "version": "5.1" }'' );',
'end;'))
);
end;
/
-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'HAYDEN_KSCOPE2018';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA HAYDEN_KSCOPE2018 - User Interface Defaults, Table Defaults
--
-- Import using sqlplus as the Oracle user: APEX_050100
-- Exported 07:55 Thursday April 12, 2018 by: HAYDEN
--
 
--------------------------------------------------------------------
prompt User Interface Defaults, Attribute Dictionary
--
-- Exported 07:55 Thursday April 12, 2018 by: HAYDEN
--
-- SHOW EXPORTING WORKSPACE
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_exp_workspace := 'HAYDEN_KSCOPE2018';
 
end;
/

begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
