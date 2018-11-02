<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$listarEspeciesResponse_11" type="ListarEspeciesResponseError-1@" location="../MFL/ListarEspeciesResponseError-1.1.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ListarEspeciesResult" location="../ListarEspeciesResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/listarespeciesresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ListarEspeciesResponse-1.0.0/";
declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";


declare function xf:ListarEspeciesResponseError-1($listarEspeciesResponse_11 as element())
as element(ns0:ListarEspeciesResult) {
<ns0:ListarEspeciesResult>
<ns0:ListarEspeciesResponse>
<ns1:BGBAResultadoOperacion>
<ns1:Severidad>ERROR</ns1:Severidad>
<ns1:Codigo> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ListarEspeciesResponse></ns0:ListarEspeciesResult>

};

declare variable $listarEspeciesResponse_11 as element() external; 

xf:ListarEspeciesResponseError-1($listarEspeciesResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ListarEspeciesResponseError-1.1.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ListarEspeciesResponseError-1.1.0"/>
    </con:dependency>
    <con:dependency location="../ListarEspeciesResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ListarEspeciesResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>