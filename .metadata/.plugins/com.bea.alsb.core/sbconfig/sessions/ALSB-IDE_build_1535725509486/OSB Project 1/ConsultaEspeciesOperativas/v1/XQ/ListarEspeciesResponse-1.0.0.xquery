<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$listarEspeciesResponse_11" type="ListarEspeciesResponse-1@" location="../MFL/ListarEspeciesResponseError-1.0.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ListarEspeciesResult" location="../ListarEspeciesResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/listarespeciesresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ListarEspeciesResponse-1.0.0/";
declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";


 declare function local:ManejadorFechaToXML($fechaInput as xs:string) as xs:string
{
concat(substring($fechaInput,1,4),'-',substring($fechaInput,5,2),'-',substring($fechaInput,7,2))
};


declare function local:ManejadorImportesResp($importe as xs:string,
$cantidadDecimales as xs:string)
as xs:string {
let $longitud:=string-length($importe)
return
concat(xs:decimal(substring($importe,1,$longitud - xs:int($cantidadDecimales))),'.',substring($importe,$longitud+1-xs:int($cantidadDecimales)))
};

declare function local:ManejadorBooleano($caracter as xs:string)
as xs:boolean {
if(fn:upper-case($caracter) = 'S' ) then (
	fn:true() )
 else(
 	fn:false()
 )
};

declare function xf:ListarEspeciesResponse-1($listarEspeciesResponse_11 as element())
as element(ns0:ListarEspeciesResult) {
<ns0:ListarEspeciesResult>
<ns0:ListarEspeciesResponse>
<ns1:BGBAResultadoOperacion>
<ns1:Severidad>OK</ns1:Severidad>
<ns1:Codigo> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($listarEspeciesResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns0:Datos>
<ns0:Rellemado>
<ns0:IndicadorRellamado> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-INDICADOR-RELLAMADO)}</ns0:IndicadorRellamado>
<ns0:EspecieRellamado> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-ESPECIE-RELLAMADO)}</ns0:EspecieRellamado>
</ns0:Rellemado>
<ns0:Especies>

 {  let $cantidad := fn:count($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES)
 	for $i in (1 to $cantidad ) return
 	if(fn:boolean(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-DENOMINACION))) then
<ns0:Especie>
<ns0:DenominacionEspecie> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-DENOMINACION)}</ns0:DenominacionEspecie>
<ns0:EspecieCV> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-ESPECIE-CV)}</ns0:EspecieCV>
<ns0:CodigoMAE> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-CODIGO-MAE)}</ns0:CodigoMAE>
<ns0:CodigoBYMA> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-CODIGO-BYMA)}</ns0:CodigoBYMA>
<ns0:PlazoDefault> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-DEFAULT)}</ns0:PlazoDefault>
<ns0:PlazoCI> { local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-CI))}</ns0:PlazoCI>
<ns0:Plazo24> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-24))}</ns0:Plazo24>
<ns0:Plazo48> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-48))}</ns0:Plazo48>
<ns0:Plazo72> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-72))}</ns0:Plazo72>
<ns0:Plazo96> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-96))}</ns0:Plazo96>
<ns0:PLAZO120> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-PLAZO-120))}</ns0:PLAZO120>
<ns0:DivisaEmision> {data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-DIVISA-EMISION)}</ns0:DivisaEmision>
<ns0:OperatividadPesos> {local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-OPERATIVIDAD-PESOS))}</ns0:OperatividadPesos>
<ns0:OperatividadDolares>{local:ManejadorBooleano(data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-OPERATIVIDAD-DOLARES))}</ns0:OperatividadDolares>
<ns0:FamiliaEspecie>{data($listarEspeciesResponse_11/ResponsePrincipal/SAL-DATOS/LIESO-LISTA-ESPECIES[$i]/LIESO-CARAC)}</ns0:FamiliaEspecie>
</ns0:Especie>
else ()
}</ns0:Especies>
</ns0:Datos>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ListarEspeciesResponse></ns0:ListarEspeciesResult>

};

declare variable $listarEspeciesResponse_11 as element() external; 

xf:ListarEspeciesResponse-1($listarEspeciesResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ListarEspeciesResponseError-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ListarEspeciesResponseError-1.0.0"/>
    </con:dependency>
    <con:dependency location="../ListarEspeciesResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ListarEspeciesResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>