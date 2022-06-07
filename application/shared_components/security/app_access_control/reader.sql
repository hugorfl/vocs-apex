prompt --application/shared_components/security/app_access_control/reader
begin
--   Manifest
--     ACL ROLE: Reader
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>7864481463549393
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'IOT'
);
wwv_flow_api.create_acl_role(
 p_id=>wwv_flow_api.id(8072800210865919)
,p_static_id=>'READER'
,p_name=>'Reader'
,p_description=>'Role assigned to application readers.'
);
wwv_flow_api.component_end;
end;
/
