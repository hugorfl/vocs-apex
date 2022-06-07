prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2021.10.15'
,p_release=>'21.2.6'
,p_default_workspace_id=>7864481463549393
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'IOT'
);
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(8069507814865894)
,p_name=>'Home'
,p_alias=>'HOME1'
,p_step_title=>'Home'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_last_updated_by=>'A00354851@TEC.MX'
,p_last_upd_yyyymmddhh24miss=>'20220527012635'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8091626890866075)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(7984305085865807)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(7881408917865687)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(8046445183865854)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8141232170910201)
,p_plug_name=>'VOCs'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleA'
,p_plug_template=>wwv_flow_api.id(7924965668865779)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with rws as (',
'  select o.*, row_number () over (',
'           partition by device_id',
'           order by id desc',
'         ) rn',
'  from   vocs o',
')',
'  select * from rws',
'  where  rn <= 1',
'  order  by device_id desc;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_no_data_found=>'no device found'
,p_show_total_row_count=>false
);
wwv_flow_api.create_card(
 p_id=>wwv_flow_api.id(9273990908931301)
,p_region_id=>wwv_flow_api.id(8141232170910201)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'DEVICE_ID'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'DEVICE_NAME'
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'Tolueno: &TOLUENE. ppm<br/>',
unistr('Temperatura: &TEMPERATURE.\00B0C<br/> '),
'Humedad: &HUMIDITY.%'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'DEVICE_NAME'
,p_icon_position=>'TOP'
,p_icon_description=>'&DEVICE_NAME.'
,p_badge_column_name=>'DEVICE_ID'
,p_badge_label=>'&DEVICE_NAME.'
,p_media_adv_formatting=>false
,p_pk1_column_name=>'DEVICE_ID'
);
wwv_flow_api.create_card_action(
 p_id=>wwv_flow_api.id(8141345238910202)
,p_card_id=>wwv_flow_api.id(9273990908931301)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1:P1_DEVICE_ID:&DEVICE_ID.'
);
wwv_flow_api.component_end;
end;
/
