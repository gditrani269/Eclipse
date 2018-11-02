<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:mfl-element-parameter parameter="$obtenerComisionClienteResponse_11" type="ObtenerComisionClienteResponse-1@" location="../MFL/ObtenerComisionClienteResponse-1.0.0.mfl" ::)
(:: pragma bea:global-element-return element="ns0:ObtenerComisionClienteResult" location="../ObtenerComisionClienteResponse-1.0.0.xsd" ::)

declare namespace ns1 = "http://ws.bancogalicia.com.ar/webservices/globales/bgbaresultadooperacion/2_0_0";
declare namespace ns0 = "http://ws.bancogalicia.com.ar/webservices/consultaespeciesoperativas/obtenercomisionclienteresponse/1_0_0";
declare namespace xf = "http://tempuri.org/ConsultaEspeciesOperativas/XQ/ObtenerComisionClienteResponse-1.0.0/";
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

declare function xf:ObtenerComisionClienteResponse-1($obtenerComisionClienteResponse_11 as element())
as element(ns0:ObtenerComisionClienteResult) {
<ns0:ObtenerComisionClienteResult>
<ns0:ObtenerComisionClienteResponse>
<ns1:BGBAResultadoOperacion>
<ns1:Severidad>OK</ns1:Severidad>
<ns1:Codigo> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-CODIGO)}</ns1:Codigo>
<ns1:Descripcion> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-DESCRIPCION)}</ns1:Descripcion>
<ns1:Tipo> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/HEADER/BGR-TIPO)}</ns1:Tipo>
</ns1:BGBAResultadoOperacion>
<ns0:Datos>
<ns0:MonedaLiquidacion> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-MONEDA-LIQ)}</ns0:MonedaLiquidacion>
<ns0:ComisionBanco> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-COMISION-BANCO),"2")}</ns0:ComisionBanco>
<ns0:BonificacionCanal> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-COM-BCO-BON-CAN),"2")}</ns0:BonificacionCanal>
<ns0:BonificacionCliente> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-COM-BCO-BON-CLIE),"2")}</ns0:BonificacionCliente>
<ns0:ComisionAgente> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-COMISION-AGENTE),"2")}</ns0:ComisionAgente>
<ns0:DerechoMercado> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-DERECHO-MERCADO),"2")}</ns0:DerechoMercado>
<ns0:DerechoBolsa> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-DERECHO-BOLSA),"2")}</ns0:DerechoBolsa>
<ns0:Iva1> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-IVA-1),"2")}</ns0:Iva1>
<ns0:Iva2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-IVA-2),"2")}</ns0:Iva2>
<ns0:Iva3> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-IVA-3),"2")}</ns0:Iva3>
<ns0:RentaFinanciera> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-RENTA-FINANCIERA),"2")}</ns0:RentaFinanciera>
<ns0:OtrasComisiones> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-OTRAS-COMISIONES),"2")}</ns0:OtrasComisiones>
<ns0:NetoFinal> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-NETO),"2")}</ns0:NetoFinal>
<ns0:TotalGastos> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-TOTAL-GASTOS),"2")}</ns0:TotalGastos>
<ns0:NumeroCuenta> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-CUENTA-MERCADO/COMIO-NRO-CUENTA)}</ns0:NumeroCuenta>
<ns0:Digito1> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-CUENTA-MERCADO/COMIO-DIGITO-1)}</ns0:Digito1>
<ns0:SucursalCuenta> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-CUENTA-MERCADO/COMIO-SUC-CUENTA)}</ns0:SucursalCuenta>
<ns0:Digito2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-CUENTA-MERCADO/COMIO-DIGITO-2)}</ns0:Digito2>
<ns0:TipoCuenta> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-OP/COMIO-CUENTA-MERCADO/COMIO-TIPO-CUENTA)}</ns0:TipoCuenta>
<ns0:MonedaLiquidacion2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-MONEDA-OPE-2)}</ns0:MonedaLiquidacion2>
<ns0:ComisionBanco2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-COMISION-BANCO-2),"2")}</ns0:ComisionBanco2>
<ns0:BonificacionCanal2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-COM-BCO-BON-CAN-2),"2")}</ns0:BonificacionCanal2>
<ns0:BonificacionCliente2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-COM-BCO-BON-CLIE-2),"2")}</ns0:BonificacionCliente2>
<ns0:ComisionAgente2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-COMISION-AGENTE-2),"2")}</ns0:ComisionAgente2>
<ns0:DerechoMercado2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-DERECHO-MERCADO-2),"2")}</ns0:DerechoMercado2>
<ns0:DerechoBolsa2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-DERECHO-BOLSA-2),"2")}</ns0:DerechoBolsa2>
<ns0:Iva1-2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-IVA-1-2),"2")}</ns0:Iva1-2>
<ns0:Iva2-2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-IVA-2-2),"2")}</ns0:Iva2-2>
<ns0:Iva3-3> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-IVA-3-2),"2")}</ns0:Iva3-3>
<ns0:RentaFinanciera2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-RENTA-FINANCIERA-2),"2")}</ns0:RentaFinanciera2>
<ns0:OtrasComisiones2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-OTRAS-COMISIONES-2),"2")}</ns0:OtrasComisiones2>
<ns0:NetoFinal2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-NETO-2),"2")}</ns0:NetoFinal2>
<ns0:TotalGastos2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-TOTAL-GASTOS-2),"2")}</ns0:TotalGastos2>

<ns0:NumeroCuenta2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-CUENTA-MERCADO-2/COMIO-NRO-CUENTA-2)}</ns0:NumeroCuenta2>
<ns0:Digito1-2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-CUENTA-MERCADO-2/COMIO-DIGITO-1-2)}</ns0:Digito1-2>
<ns0:SucursalCuenta2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-CUENTA-MERCADO-2/COMIO-SUC-CUENTA-2)}</ns0:SucursalCuenta2>
<ns0:Digito2-2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-CUENTA-MERCADO-2/COMIO-DIGITO-2-2)}</ns0:Digito2-2>
<ns0:TipoCuenta2> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-CUENTA-MERCADO-2/COMIO-TIPO-CUENTA-2)}</ns0:TipoCuenta2>

<ns0:TipoCambio2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIQ-MON-2/COMIO-TIPO-CAMBIO-2),"4")}</ns0:TipoCambio2>

<ns0:PerfilIva> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PERFIL-IVA)}</ns0:PerfilIva>
<ns0:NumeroOperacion> {data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-NUM-OPER-MERCADO)}</ns0:NumeroOperacion>

<ns0:Cantidad> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-CANTIDAD),"7")}</ns0:Cantidad>
<ns0:LimiteMinimoOper> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIMITE-MIN-CAN),"2")}</ns0:LimiteMinimoOper>
<ns0:LimiteMaximoOper> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-LIMITE-MAX-CAN),"2")}</ns0:LimiteMaximoOper>

<ns0:PorcentajeDerMercado> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-DER-MERCADO),"4")}</ns0:PorcentajeDerMercado>
<ns0:PorcentajeDerBolsa> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-DER-BOLSA),"4")}</ns0:PorcentajeDerBolsa>
<ns0:PorcentajeComAgente> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-COM-AGENTE),"4")}</ns0:PorcentajeComAgente>
<ns0:PorcentajeComBanco> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-COM-BANCO),"4")}</ns0:PorcentajeComBanco>
<ns0:PorcentajeOtrosGastos> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-OTROS-GASTOS),"4")}</ns0:PorcentajeOtrosGastos>
<ns0:PorcentajeIva1> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-IVA1),"4")}</ns0:PorcentajeIva1>
<ns0:PorcentajeIva2> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-IVA2),"4")}</ns0:PorcentajeIva2>
<ns0:PorcentajeIva3> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-IVA3),"4")}</ns0:PorcentajeIva3>
<ns0:PorcentajeBonifCanal> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-BONI-CANAL),"4")}</ns0:PorcentajeBonifCanal>
<ns0:PorcentajeBonifClie> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-BONI-CLIEN),"4")}</ns0:PorcentajeBonifClie>
<ns0:PorcentajeRentaFinanciera> {local:ManejadorImportesResp(data($obtenerComisionClienteResponse_11/ResponsePrincipal/SAL-DATOS/REG-COMIO-OUTPUT/COMIO-PORCENTAJES/COMIO-PORC-RENTA-FINANCIERA),"4")}</ns0:PorcentajeRentaFinanciera>
</ns0:Datos>
<ns1:BGBAResultadoOperacionLog/>
</ns0:ObtenerComisionClienteResponse></ns0:ObtenerComisionClienteResult>

};

declare variable $obtenerComisionClienteResponse_11 as element() external; 

xf:ObtenerComisionClienteResponse-1($obtenerComisionClienteResponse_11)]]></con:xquery>
    <con:dependency location="../MFL/ObtenerComisionClienteResponse-1.0.0.mfl">
        <con:mfl ref="OSB Project 1/ConsultaEspeciesOperativas/v1/MFL/ObtenerComisionClienteResponse-1.0.0"/>
    </con:dependency>
    <con:dependency location="../ObtenerComisionClienteResponse-1.0.0.xsd">
        <con:schema ref="OSB Project 1/ConsultaEspeciesOperativas/v1/ObtenerComisionClienteResponse-1.0.0"/>
    </con:dependency>
</con:xqueryEntry>