<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$obtenerComisionClienteResponse_11" type="ObtenerComisionClienteResponseError-1@" location="../MFL/ObtenerComisionClienteResponseError-1.0.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ObtenerComisionClienteResult" location="../ObtenerComisionClienteResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercomisionclienteresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerComisionClienteResponse-1.0.0/";
declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";


declare function xf:ObtenerComisionClienteResponseError-1($obtenerComisionClienteResponse_11 as element())
as element(ns0:ObtenerComisionClienteResult) {
<ns0:ObtenerComisionClienteResult>
<ns0:ObtenerComisionClienteResponse xmlns:ns0="http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercomisionclienteresponse/1_0_0">
<ns1:BGBAResultadoOperacion xmlns:ns1="http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0">
<ns1:Severidad>ERROR</ns1:Severidad>
<ns1:Codigo> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ObtenerComisionClienteResponse></ns0:ObtenerComisionClienteResult>

};

declare variable $obtenerComisionClienteResponse_11 as element() external; 

xf:ObtenerComisionClienteResponseError-1($obtenerComisionClienteResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ObtenerComisionClienteResponseError-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ObtenerComisionClienteResponseError-1.0.0"/>
    </con:dependency>
    <con:dependency location="../ObtenerComisionClienteResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ObtenerComisionClienteResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>