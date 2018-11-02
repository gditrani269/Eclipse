<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$obtenerCotizacionesMercadosResponse_11" type="ObtenerCotizacionesMercadosResponseError-1@" location="../MFL/ObtenerCotizacionesMercadosResponseError-1.0.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ObtenerCotizacionesMercadosResult" location="../ObtenerCotizacionesMercadosResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercotizacionesmercadosresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerCotizacionesMercadosResponse-1.0.0/";
declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";


declare function xf:ObtenerCotizacionesMercadosResponseError-1($obtenerCotizacionesMercadosResponse_11 as element())
as element(ns0:ObtenerCotizacionesMercadosResult) {
<ns0:ObtenerCotizacionesMercadosResult>
<ns0:ObtenerCotizacionesMercadosResponse>
<ns1:BGBAResultadoOperacion>
<ns1:Severidad>ERROR</ns1:Severidad>
<ns1:Codigo> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ObtenerCotizacionesMercadosResponse></ns0:ObtenerCotizacionesMercadosResult>

};

declare variable $obtenerCotizacionesMercadosResponse_11 as element() external; 

xf:ObtenerCotizacionesMercadosResponseError-1($obtenerCotizacionesMercadosResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ObtenerCotizacionesMercadosResponseError-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ObtenerCotizacionesMercadosResponseError-1.0.0"/>
    </con:dependency>
    <con:dependency location="../ObtenerCotizacionesMercadosResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ObtenerCotizacionesMercadosResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>