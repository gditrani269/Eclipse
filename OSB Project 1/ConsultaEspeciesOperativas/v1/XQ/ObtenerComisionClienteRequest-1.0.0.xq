(:: pragma bea:global-element-parameter parameter="$obtenerComisionCliente_11" element="ns1:ObtenerComisionCliente" location="../ObtenerComisionClienteRequest-1.0.0.xsd" ::)
(:: pragma bea:mfl-element-return type="ObtenerComisionClienteRequest-1@" location="../MFL/ObtenerComisionClienteRequest-1.0.0.mfl" ::)

declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaheader/2_0_0";
declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercomisionclienterequest/1_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerComisionClienteRequest-1.0.0/";


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
declare function xf:ObtenerComisionClienteRequest-1($obtenerComisionCliente_11 as element(ns1:ObtenerComisionCliente))
as element() {
<ObtenerComisionClienteRequest-1>
<RequestPrincipal>
<RCV-HEADER-ENTRADA>
<BGHEADER>
<BGH-ID>
<BGH-IDMSG>
<BGH-IDMSG-ESQUEMA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje/@idEsquema)}</BGH-IDMSG-ESQUEMA>
<BGH-IDMSG-ID> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdMensaje)}</BGH-IDMSG-ID>
</BGH-IDMSG>
<BGH-IDANT>
<BGH-IDANT-ESQUEMA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior/@idEsquema)}</BGH-IDANT-ESQUEMA>
<BGH-IDANT-ID> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdMensajeAnterior)}</BGH-IDANT-ID>
</BGH-IDANT>
<BGH-IDOPER>
<BGH-IDOPER-ESQUEMA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion/@idEsquema)}</BGH-IDOPER-ESQUEMA>
<BGH-IDOPER-ID> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Identificadores/*:IdOperacion)}</BGH-IDOPER-ID>
</BGH-IDOPER>
</BGH-ID>
<BGH-MOD>
<BGH-MOD-GALICIA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdGalicia)}</BGH-MOD-GALICIA>
<BGH-MOD-CONSUMIDOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdConsumidor)}</BGH-MOD-CONSUMIDOR>
<BGH-MOD-PROVEEDOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:ModuloAplicativo/*:IdProveedor)}</BGH-MOD-PROVEEDOR>
</BGH-MOD>
<BGH-IP> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Equipo/@ip)}</BGH-IP>
<BGH-ORI>
<BGH-ORI-MOD>
<BGH-ORI-GALICIA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdGalicia)}</BGH-ORI-GALICIA>
<BGH-ORI-CONSUMIDOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdConsumidor)}</BGH-ORI-CONSUMIDOR>
<BGH-ORI-PROVEEDOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:ModuloAplicativo/*:IdProveedor)}</BGH-ORI-PROVEEDOR>
</BGH-ORI-MOD>
<BGH-ORI-CANAL> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:Canal)}</BGH-ORI-CANAL>
<BGH-ORI-ORGA>
<BGH-ORI-ORGA-TIPO> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@tipo)}</BGH-ORI-ORGA-TIPO>
<BGH-ORI-ORGA-ID> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:OrganizacionInterna/@id)}</BGH-ORI-ORGA-ID>
</BGH-ORI-ORGA>
<BGH-ORI-IP> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:Equipo/@ip)}</BGH-ORI-IP>
<BGH-ORI-TERMINAL> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:Terminal)}</BGH-ORI-TERMINAL>
<BGH-ORI-FECHAYHORA>
<BGH-ORI-TIMESTAMP> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:FechaHoraCreacion)}</BGH-ORI-TIMESTAMP>
<BGH-ORI-GMT>
</BGH-ORI-GMT>
</BGH-ORI-FECHAYHORA>
<BGH-ORI-CLIENTE>
<BGH-ORI-CL-ESQUEMA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:IdCliente/*:idEsquema)}</BGH-ORI-CL-ESQUEMA>
<BGH-ORI-CL-ID> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:IdCliente)}</BGH-ORI-CL-ID>
</BGH-ORI-CLIENTE>
<BGH-ORI-OPERADOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:Operador)}</BGH-ORI-OPERADOR>
<BGH-ORI-SUPERVISOR> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:BGBAHeader/*:Origen/*:Supervision)}</BGH-ORI-SUPERVISOR>
</BGH-ORI>
</BGHEADER>
</RCV-HEADER-ENTRADA>
<ENT-VISTA-INPUT>
<REG-COMII-INPUT>
<COMII-COMITENTE>
<COMII-BANCO> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:BancoCuentaComitente)}</COMII-BANCO>
<COMII-SUCURSAL> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:SucursalCuentaComitente)}</COMII-SUCURSAL>
<COMII-NRO-COMITENTE> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:NumeroCuentaComitente)}</COMII-NRO-COMITENTE>
</COMII-COMITENTE>
<COMII-ESPECIE> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Especie)}</COMII-ESPECIE>
<COMII-MONTO-BRUTO> {local:ManejadorImportes(data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Montobruto),"2")}</COMII-MONTO-BRUTO>
<COMII-MERCADO> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Mercado)}</COMII-MERCADO>
<COMII-CANAL> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Canal)}</COMII-CANAL>
<COMII-DIVISA> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Divisa)}</COMII-DIVISA>
<COMII-TIPO-OPERACION> {data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:TipoOperacion)}</COMII-TIPO-OPERACION>
<COMII-MONTO-NETO> {local:ManejadorImportes(data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:MontoNeto),"2")}</COMII-MONTO-NETO>
<COMII-PRECIO> {local:ManejadorImportes(data($obtenerComisionCliente_11/*:ObtenerComisionClienteRequest/*:Datos/*:Precio),"6")}</COMII-PRECIO>
</REG-COMII-INPUT>
</ENT-VISTA-INPUT>
</RequestPrincipal>
</ObtenerComisionClienteRequest-1>
};

declare variable $obtenerComisionCliente_11 as element(ns1:ObtenerComisionCliente) external;

xf:ObtenerComisionClienteRequest-1($obtenerComisionCliente_11)