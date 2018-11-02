<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$obtenerCotizacionesMercadosResponse_11" type="ObtenerCotizacionesMercadosResponse-1@" location="../MFL/ObtenerCotizacionesMercadosResponse-1.0.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ObtenerCotizacionesMercadosResult" location="../ObtenerCotizacionesMercadosResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercotizacionesmercadosresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerCotizacionesMercadosResponse-1.0.0/";
declare namespace ns2 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbatiposbase/2_0_0";


 declare function local:ManejadorFechaToXML($fechaInput as xs:string) as xs:string
{
concat(substring($fechaInput,1,4),'-',substring($fechaInput,5,2),'-',substring($fechaInput,7,2))
};


declare function local:ManejadorImportesResp($importe as xs:string,
$cantidadDecimales as xs:string)
as xs:string {
let $importeFixUnsigned := fn:replace(fn-bea:trim($importe),"-","")
let $importeFix := fn:replace(fn-bea:trim($importeFixUnsigned),",","")
let $longitud:=string-length($importeFix)
return
if (fn:contains($importe,"-")) then
concat("-",xs:decimal(substring($importeFix,1,$longitud - xs:int($cantidadDecimales))),'.',substring($importeFix,$longitud+1-xs:int($cantidadDecimales)))
else 
(concat(xs:decimal(substring($importeFix,1,$longitud - xs:int($cantidadDecimales))),'.',substring($importeFix,$longitud+1-xs:int($cantidadDecimales)))
)
};

declare function xf:ObtenerCotizacionesMercadosResponse-1($obtenerCotizacionesMercadosResponse_11 as element())
as element(ns0:ObtenerCotizacionesMercadosResult) {
<ns0:ObtenerCotizacionesMercadosResult>
<ns0:ObtenerCotizacionesMercadosResponse>
<ns1:BGBAResultadoOperacion>
<ns1:Severidad>OK</ns1:Severidad>
<ns1:Codigo> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns0:Datos>
<ns0:Moneda> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-MONEDA)}</ns0:Moneda>
<ns0:Plazo> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-PLAZO)}</ns0:Plazo>
<ns0:TipoOperacion> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-TIPO-OPERACION)}</ns0:TipoOperacion>
<ns0:MercadoMejorPrecio> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-MEJOR-MERCADO)}</ns0:MercadoMejorPrecio>
<ns0:DescripcionMercadoMejorPrecio> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-DESC-MEJOR-MERCADO)}</ns0:DescripcionMercadoMejorPrecio>
<ns0:MejorPrecio>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-MEJOR-PRECIO),"8") }</ns0:MejorPrecio>
<ns0:EsMercadoAutomatico>{ let $v:= upper-case(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-IND-MERCADO-AUTO-MANUAL)) return if ($v='S') then 'true' else 'false'}</ns0:EsMercadoAutomatico>
<ns0:EsMercadoObligatorio>{ let $v:= upper-case(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-IND-MERCADO-OBLIG)) return if ($v='S') then 'true' else 'false'}</ns0:EsMercadoObligatorio>
<ns0:EsMercadoSugerido>{ let $v:= upper-case(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-IND-MERCADO-SUGER)) return if ($v='S') then 'true' else 'false'}</ns0:EsMercadoSugerido>
<ns0:Ofertas>
 { for $i in (1 to 8)  return
 if (fn:boolean(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-MERCADO))) then  
<ns0:Oferta>
<ns0:IdMercado> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-MERCADO)}</ns0:IdMercado>
<ns0:DescripcionMercado> {data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-DES-MERCADO)}</ns0:DescripcionMercado>
<ns0:PrecioUltimoOperado>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-PRE-ULT-OPER),"8") }</ns0:PrecioUltimoOperado>
<ns0:PrecioCierreAnterior>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-CIERRE-ANT),"8") }</ns0:PrecioCierreAnterior>
<ns0:PorcentajeVariacion> {local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VAR-PORC),"2")}</ns0:PorcentajeVariacion>
<ns0:MontoVariacion>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VAR-MONTO),"2") }</ns0:MontoVariacion>
<ns0:OfertasCompra>
<ns0:Volumen1>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-VOL-1),"7") }</ns0:Volumen1>
<ns0:Precio1>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-PRECIO-1),"8") }</ns0:Precio1>
<ns0:Volumen2>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-VOL-2),"7") }</ns0:Volumen2>
<ns0:Precio2>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-PRECIO-2),"8") }</ns0:Precio2>
<ns0:Volumen3>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-VOL-3),"7") }</ns0:Volumen3>
<ns0:Precio3>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-PRECIO-3),"8") }</ns0:Precio3>
<ns0:Volumen4>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-VOL-4),"7") }</ns0:Volumen4>
<ns0:Precio4>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-PRECIO-4),"8") }</ns0:Precio4>
<ns0:Volumen5>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-VOL-5),"7") }</ns0:Volumen5>
<ns0:Precio5>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-COMPRA/MEMEO-OFER-COM-PRECIO-5),"8") }</ns0:Precio5>
</ns0:OfertasCompra>
<ns0:OfertasVenta>
<ns0:Volumen1>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-VOL-1),"7") }</ns0:Volumen1>
<ns0:Precio1>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-PRECIO-1),"8") }</ns0:Precio1>
<ns0:Volumen2>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-VOL-2),"7") }</ns0:Volumen2>
<ns0:Precio2>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-PRECIO-2),"8") }</ns0:Precio2>
<ns0:Volumen3>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-VOL-3),"7") }</ns0:Volumen3>
<ns0:Precio3>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-PRECIO-3),"8") }</ns0:Precio3>
<ns0:Volumen4>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-VOL-4),"7") }</ns0:Volumen4>
<ns0:Precio4>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-PRECIO-4),"8") }</ns0:Precio4>
<ns0:Volumen5>{ local:ManejadorImportesResp(data($obtenerCotizacionesMercadosResponse_11/ResponsePrincipal/SAL-DATOS/REG-MEMEO/MEMEO-DATOS-MERCADOS/MEMEO-OFERTAS-MERCADO/MEMEO-OFERTAS[$i]/MEMEO-OFER-VENTA/MEMEO-OFER-VEN-VOL-5),"7") }</ns0:Volumen5>
<ns0:Precio5>1</ns0:Precio5>
</ns0:OfertasVenta>
</ns0:Oferta>
else ()
}
</ns0:Ofertas>
</ns0:Datos>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ObtenerCotizacionesMercadosResponse>
</ns0:ObtenerCotizacionesMercadosResult>

};

declare variable $obtenerCotizacionesMercadosResponse_11 as element() external; 

xf:ObtenerCotizacionesMercadosResponse-1($obtenerCotizacionesMercadosResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ObtenerCotizacionesMercadosResponse-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ObtenerCotizacionesMercadosResponse-1.0.0"/>
    </con:dependency>
    <con:dependency location="../ObtenerCotizacionesMercadosResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ObtenerCotizacionesMercadosResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>