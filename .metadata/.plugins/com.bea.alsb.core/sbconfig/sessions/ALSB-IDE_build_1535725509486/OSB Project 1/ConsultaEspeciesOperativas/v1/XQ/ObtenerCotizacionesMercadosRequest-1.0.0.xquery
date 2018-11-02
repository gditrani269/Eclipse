<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$obtenerCotizacionesMercados_11" element="ns1:ObtenerCotizacionesMercados" location="../ObtenerCotizacionesMercadosRequest-1.0.0.xsd" ::)
(:: pragma bea:mfl-element-return type="ObtenerCotizacionesMercadosRequest-1@" location="../MFL/ObtenerCotizacionesMercadosRequest-1.0.0.mfl" ::)

declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaheader/2_0_0";
declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercotizacionesmercadosrequest/1_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/3_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerCotizacionesMercadosRequest-1.0.0/";


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
declare function xf:ObtenerCotizacionesMercadosRequest-1($obtenerCotizacionesMercados_11 as element(ns1:ObtenerCotizacionesMercados))
as element() {
<ObtenerCotizacionesMercadosRequest-1>
<RequestPrincipal>
<RCV-HEADER-ENTRADA>
<BGHEADER>
<BGH-ID>
<BGH-IDMSG>
<BGH-IDMSG-ESQUEMA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje/@idEsquema)}</BGH-IDMSG-ESQUEMA>
<BGH-IDMSG-ID> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje)}</BGH-IDMSG-ID>
</BGH-IDMSG>
<BGH-IDANT>
<BGH-IDANT-ESQUEMA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior/@idEsquema)}</BGH-IDANT-ESQUEMA>
<BGH-IDANT-ID> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior)}</BGH-IDANT-ID>
</BGH-IDANT>
<BGH-IDOPER>
<BGH-IDOPER-ESQUEMA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion/@idEsquema)}</BGH-IDOPER-ESQUEMA>
<BGH-IDOPER-ID> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion)}</BGH-IDOPER-ID>
</BGH-IDOPER>
</BGH-ID>
<BGH-MOD>
<BGH-MOD-GALICIA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdGalicia)}</BGH-MOD-GALICIA>
<BGH-MOD-CONSUMIDOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdConsumidor)}</BGH-MOD-CONSUMIDOR>
<BGH-MOD-PROVEEDOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdProveedor)}</BGH-MOD-PROVEEDOR>
</BGH-MOD>
<BGH-IP> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Equipo/@ip)}</BGH-IP>
<BGH-ORI>
<BGH-ORI-MOD>
<BGH-ORI-GALICIA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdGalicia)}</BGH-ORI-GALICIA>
<BGH-ORI-CONSUMIDOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdConsumidor)}</BGH-ORI-CONSUMIDOR>
<BGH-ORI-PROVEEDOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdProveedor)}</BGH-ORI-PROVEEDOR>
</BGH-ORI-MOD>
<BGH-ORI-CANAL> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:Canal)}</BGH-ORI-CANAL>
<BGH-ORI-ORGA>
<BGH-ORI-ORGA-TIPO> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@tipo)}</BGH-ORI-ORGA-TIPO>
<BGH-ORI-ORGA-ID> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@id)}</BGH-ORI-ORGA-ID>
</BGH-ORI-ORGA>
<BGH-ORI-IP> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:Equipo/@ip)}</BGH-ORI-IP>
<BGH-ORI-TERMINAL> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:Terminal)}</BGH-ORI-TERMINAL>
<BGH-ORI-FECHAYHORA>
<BGH-ORI-TIMESTAMP> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:FechaHoraCreacion)}</BGH-ORI-TIMESTAMP>
<BGH-ORI-GMT>
</BGH-ORI-GMT>
</BGH-ORI-FECHAYHORA>
<BGH-ORI-CLIENTE>
<BGH-ORI-CL-ESQUEMA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:IdCliente/*:idEsquema)}</BGH-ORI-CL-ESQUEMA>
<BGH-ORI-CL-ID> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:IdCliente)}</BGH-ORI-CL-ID>
</BGH-ORI-CLIENTE>
<BGH-ORI-OPERADOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:Operador)}</BGH-ORI-OPERADOR>
<BGH-ORI-SUPERVISOR> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:BGBAHeader/*:Origen/*:Supervision)}</BGH-ORI-SUPERVISOR>
</BGH-ORI>
</BGHEADER>
</RCV-HEADER-ENTRADA>
<REG-MEMEI>
<MEMEI-CANAL-INGRESO> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:CanalIngreso)}</MEMEI-CANAL-INGRESO>
<MEMEI-SISTEMA-INGRESO> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:SistemaIngreso)}</MEMEI-SISTEMA-INGRESO>
<MEMEI-ESPECIE> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:Especie)}</MEMEI-ESPECIE>
<MEMEI-TIPO-OPERACION> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:TipoOperacion)}</MEMEI-TIPO-OPERACION>
<MEMEI-PLAZO> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:Plazo)}</MEMEI-PLAZO>
<MEMEI-MONEDA> {data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:Moneda)}</MEMEI-MONEDA>
<MEMEI-GRABA-TS>N</MEMEI-GRABA-TS>
<MEMEI-SERVICIO>{data($obtenerCotizacionesMercados_11/*:ObtenerCotizacionesMercadosRequest/*:Datos/*:Servicio)}</MEMEI-SERVICIO>
</REG-MEMEI>
</RequestPrincipal>
</ObtenerCotizacionesMercadosRequest-1>
};

declare variable $obtenerCotizacionesMercados_11 as element(ns1:ObtenerCotizacionesMercados) external;

xf:ObtenerCotizacionesMercadosRequest-1($obtenerCotizacionesMercados_11)]]></con:xquery>
    <con:dependency location="../ObtenerCotizacionesMercadosRequest-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ObtenerCotizacionesMercadosRequest-1.0.0"/>
    </con:dependency>
    <con:dependency location="../MFL/ObtenerCotizacionesMercadosRequest-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ObtenerCotizacionesMercadosRequest-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>