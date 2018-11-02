<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$listarEspecies_11" element="ns1:ListarEspecies" location="../ListarEspeciesRequest-1.0.0.xsd" ::)
(:: pragma bea:mfl-element-return type="ListarEspeciesRequest-1@" location="../MFL/ListarEspeciesRequest-1.0.0.mfl" ::)

declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaheader/2_0_0";
declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/listarespeciesrequest/1_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ListarEspeciesRequest-1.0.0/";


 declare function local:ManejadorFechaToMFL($fechaInput as xs:string) as xs:string
{
concat(substring($fechaInput,1,4),substring($fechaInput,6,2),substring($fechaInput,9,2))
};


declare function pad-decimal-to-length 
($valu as xs:string,$longDec as xs:unsignedInt)  as xs:string {
let $longValu:=string-length($valu)
return    
if ($longValu<$longDec)
then
concat($valu , (for $i in 1 to $longDec - $longValu return '0')) 
else $valu
} ;
declare function local:ManejadorImportes($importe as xs:string,
$cantidadDecimales as xs:string)
as xs:string {
if (string-length(substring-before($importe,'.'))=0) then
concat($importe,pad-decimal-to-length(substring-after($importe,'.'),xs:unsignedInt($cantidadDecimales)))
else        
concat(substring-before($importe,'.'),pad-decimal-to-length(substring-after($importe,'.'),xs:unsignedInt($cantidadDecimales)))
};
declare function xf:ListarEspeciesRequest-1($listarEspecies_11 as element(ns1:ListarEspecies))
as element() {
<ListarEspeciesRequest-1>
<RequestPrincipal>
<RCV-HEADER-ENTRADA>
<BGHEADER>
<BGH-ID>
<BGH-IDMSG>
<BGH-IDMSG-ESQUEMA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje/@idEsquema)}</BGH-IDMSG-ESQUEMA>
<BGH-IDMSG-ID> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje)}</BGH-IDMSG-ID>
</BGH-IDMSG>
<BGH-IDANT>
<BGH-IDANT-ESQUEMA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior/@idEsquema)}</BGH-IDANT-ESQUEMA>
<BGH-IDANT-ID> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior)}</BGH-IDANT-ID>
</BGH-IDANT>
<BGH-IDOPER>
<BGH-IDOPER-ESQUEMA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion/@idEsquema)}</BGH-IDOPER-ESQUEMA>
<BGH-IDOPER-ID> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion)}</BGH-IDOPER-ID>
</BGH-IDOPER>
</BGH-ID>
<BGH-MOD>
<BGH-MOD-GALICIA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdGalicia)}</BGH-MOD-GALICIA>
<BGH-MOD-CONSUMIDOR> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdConsumidor)}</BGH-MOD-CONSUMIDOR>
<BGH-MOD-PROVEEDOR> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdProveedor)}</BGH-MOD-PROVEEDOR>
</BGH-MOD>
<BGH-IP> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Equipo/@ip)}</BGH-IP>
<BGH-ORI>
<BGH-ORI-MOD>
<BGH-ORI-GALICIA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdGalicia)}</BGH-ORI-GALICIA>
<BGH-ORI-CONSUMIDOR> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdConsumidor)}</BGH-ORI-CONSUMIDOR>
<BGH-ORI-PROVEEDOR> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdProveedor)}</BGH-ORI-PROVEEDOR>
</BGH-ORI-MOD>
<BGH-ORI-CANAL> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:Canal)}</BGH-ORI-CANAL>
<BGH-ORI-ORGA>
<BGH-ORI-ORGA-TIPO> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@tipo)}</BGH-ORI-ORGA-TIPO>
<BGH-ORI-ORGA-ID> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@id)}</BGH-ORI-ORGA-ID>
</BGH-ORI-ORGA>
<BGH-ORI-IP> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:Equipo/@ip)}</BGH-ORI-IP>
<BGH-ORI-TERMINAL> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:Terminal)}</BGH-ORI-TERMINAL>
<BGH-ORI-FECHAYHORA>
<BGH-ORI-TIMESTAMP> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:FechaHoraCreacion)}</BGH-ORI-TIMESTAMP>
<BGH-ORI-GMT></BGH-ORI-GMT>
</BGH-ORI-FECHAYHORA>
<BGH-ORI-CLIENTE>
<BGH-ORI-CL-ESQUEMA> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:IdCliente/*:idEsquema)}</BGH-ORI-CL-ESQUEMA>
<BGH-ORI-CL-ID> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:IdCliente)}</BGH-ORI-CL-ID>
</BGH-ORI-CLIENTE>
<BGH-ORI-OPERADOR> {data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:Operador)}</BGH-ORI-OPERADOR>
<BGH-ORI-SUPERVISOR>{data($listarEspecies_11/*:ListarEspeciesRequest/*:BGBAHeader/*:Origen/*:Supervision)}</BGH-ORI-SUPERVISOR>
</BGH-ORI>
</BGHEADER>
</RCV-HEADER-ENTRADA>
<ENT-VISTA-OUTPUT>
<LIESI-CANAL> {data($listarEspecies_11/*:ListarEspeciesRequest/*:Datos/*:CanalDeConsulta)}</LIESI-CANAL>
<LIESI-TIPO-ESPECIE> {data($listarEspecies_11/*:ListarEspeciesRequest/*:Datos/*:TipoEspecie)}</LIESI-TIPO-ESPECIE>
<LIESI-TIPO-OPERACION> {data($listarEspecies_11/*:ListarEspeciesRequest/*:Datos/*:TipoOperacion)}</LIESI-TIPO-OPERACION>
<LIESI-CIRCUITO> {data($listarEspecies_11/*:ListarEspeciesRequest/*:Datos/*:Circuito)}</LIESI-CIRCUITO>
<LIESI-ESPECIE-RELLAMADO>{data($listarEspecies_11/*:ListarEspeciesRequest/*:Datos/*:EspecieRellamado)}</LIESI-ESPECIE-RELLAMADO>
</ENT-VISTA-OUTPUT>
</RequestPrincipal>
</ListarEspeciesRequest-1>
};

declare variable $listarEspecies_11 as element(ns1:ListarEspecies) external;

xf:ListarEspeciesRequest-1($listarEspecies_11)]]></con:xquery>
    <con:dependency location="../ListarEspeciesRequest-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ListarEspeciesRequest-1.0.0"/>
    </con:dependency>
    <con:dependency location="../MFL/ListarEspeciesRequest-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ListarEspeciesRequest-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>