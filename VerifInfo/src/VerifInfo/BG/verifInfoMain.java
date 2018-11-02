
package VerifInfo.BG;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.io.*;

import java.lang.System;


public class verifInfoMain {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
	System.out.println("Iniciando verificacion de datos");
//	System.out.println("ID SOA a verificar: " + args [0]);
	int iLengthArgs = args.length;
	
// -----------------------------------
	
    String sUriOriginal = null;
    File archivo = null;
    FileReader fr = null;
    BufferedReader br = null;
  
    String[] sNomFun;
// -----------------------------------	baja de SPS la ficha de una operacion por ID SOA -----------------------------------------
    String sIdSOA = args [0];
    int iIdSOA;
    
//    for (int iIdSOA = 960; iIdSOA < 965; ++iIdSOA) { //1869
    for (int iCountOper = 0 ; iCountOper < iLengthArgs; ++iCountOper) { //1869
    	iIdSOA = Integer.parseInt (args [iCountOper]);
    	System.out.println("------------------------------------------------------------------------------------------------------------");
    	sIdSOA = Integer.toString(iIdSOA);
    	System.out.println("ID SOA a verificar: " + sIdSOA);
	    String targetURL = "http://ecc.bancogalicia.com.ar/sites/ac/soa/_api/web/lists/getbytitle('Operaciones%20Corporativas')/items(" + sIdSOA + ")";
	    String sOperTecnica = "C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\cws\\OperacionTecnica" + sIdSOA + ".xml";
	    String sNombreFuncional = "C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\cws\\NombreFunciona" + sIdSOA + ".xml";
	    
	    Boolean bIdSoaFirstView = bGetByIDSOA (sIdSOA);
	    if (bIdSoaFirstView) {
	//    	System.out.println ("Analizando XML");
	    	sUriOriginal = sGetByIDSOA ("C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\cws\\OperacionesCorporativas" + sIdSOA + ".xml");
	    	if (sUriOriginal != "") {
//	    		System.out.println ("URL a la ficha de la operacion extraida: \n" + sUriOriginal);
	    		Boolean bDownloadPage = bGetPage (sUriOriginal, sOperTecnica);
	    		if (bDownloadPage) {
	//    			System.out.println ("Bajo la ficha de operacion Tecnica en: " + sOperTecnica);
	    			String[] res = demo (sOperTecnica);
	    			System.out.println ("El due�o del servicio es: ");
	    			bPrintConsumidores (res [2]);
	    			System.out.println ("Los consumidores de la operacion son:");
	    			bPrintConsumidores (res[0]);
//	    			System.out.println ("URL a la ficha del fwk \n" + res[1]);
	    			sUriOriginal = "http://ecc.bancogalicia.com.ar/sites/ac/soa/Lists/SC/DispForm.aspx?ID="+res[1]+"&RootFolder=%2A";
	    			bDownloadPage = bGetPage (sUriOriginal, sNombreFuncional);
	    			if (bDownloadPage) {
	    				sNomFun = sAnalisisNombreFunciona (sNombreFuncional);
	    				System.out.println ("El framework es: " + sNomFun[0]);
	    				System.out.println ("Nombre Tecnico del Servicio: " + sNomFun[1]);
	    				System.out.println ("La URL de prod es: " + sNomFun[2]);
	    			    //Revision del ExportInfo para extraer los frameworks
	    			    // segun veo el tag: exportedItemInfo instanceId="FRAMEWORK/servicio/version o carpetas si son viejos"
	  //  			    sFindFwk (sNomFun[0]);
	    			    System.out.println ("Exise el Framework en la Consola?: " + sFindFwk (sNomFun[0]));
	    			}
	    			else {
	    				System.out.println ("No pudo bajar la Ficha de del nombre funcional de: " + sUriOriginal);
	    			}
	    		}
	    		else {
	    			System.out.println ("No pudo bajar la Ficha de Operacion Tecnica de: " + sUriOriginal);
	    		}
	    	}
	    	else {
	    		System.out.println ("No se pudo obtener la URL a la ficha de la operacion: " + sIdSOA);
	    	}
	    }
	    else {
	    	System.out.println("Algo salio mal: no pudo obtener la info relacionada al IDSOA: " + sIdSOA);
	    }
    }
    

}

	private static String sFindFwk (String sFramework)
	{
		String sOut = "FwkNoExist";
		  try {
			  	int iTag = 0;
			  	String sTagFwk = "exportedItemInfo instanceId=";
			  	String sFwkTmp = "";
		        FileReader fr = null;
		        BufferedReader br = null;
			    fr = new FileReader ("C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\VerifInfo\\ExportInfo");
			    br = new BufferedReader(fr);
		        // Lectura del fichero
		        String linea;
		        String nombrecambiado;
		        boolean bSectionUri = false;
		        while((linea=br.readLine())!=null) {
//		        	System.out.println (linea);
		        	iTag = linea.indexOf(sTagFwk);
		        	if (iTag != -1) {
		        		int iBeginFwk = iTag + sTagFwk.length() + 1;
		        		int iEndFWK = linea.indexOf("/", iBeginFwk);
		        		sFwkTmp = (String) linea.subSequence(iBeginFwk, iEndFWK);
//		        		System.out.println (sFwkTmp + sFramework);
		        		if (sFwkTmp.equals(sFramework)) {
		        			sOut = "FwkSiExist";
//		        			System.out.println ("el FWK es: \n" + sFwkTmp);
		        		}
		        	}
		        }
	    	}
		    catch(Exception e){
//		        e.printStackTrace();
		        System.out.println ("sFindFwk - Problema con el archivo: " + sFramework);
		        return "Error";
		    }
		return sOut;
	}
	
	  private static Boolean bPrintConsumidores (String sConsumidore)
	  {
		  try {
//			  System.out.println ("consumidores: " + sConsumidore);
			  int iBeginConsum = sConsumidore.indexOf(";#");
			  if (iBeginConsum == -1) {
				  System.out.println ("No hay consumidores catalogados");
			  }
			  else {
				  int iEndConsum = 0;
				  int iEndString = sConsumidore.indexOf(",");
				  while (iEndConsum >= 0)
				  {
					  iEndConsum = iEndConsum + 1;
					  iBeginConsum = sConsumidore.indexOf(";#",iEndConsum)+2;
					  iEndConsum = sConsumidore.indexOf(";#",iBeginConsum);
					  if (iEndConsum < 0)
						  System.out.println ("\t" + sConsumidore.subSequence(iBeginConsum, iEndString-1));
					  else
						  System.out.println ("\t" + sConsumidore.subSequence(iBeginConsum, iEndConsum));
				  }
			  }
		  }
		  catch (Exception e) {
			  System.out.println ("No hay consumidores catalogados");
			  return false;
		  }
		  return true;
	  }
	  
	  private static Boolean bGetByIDSOA (String sIDSOA)
	  {
		    try {
		        String targetURL = "http://ecc.bancogalicia.com.ar/sites/ac/soa/_api/web/lists/getbytitle('Operaciones%20Corporativas')/items("+sIDSOA+")";
	    		FileWriter fichero = null;
	    		PrintWriter pw = null;
	    		fichero = new FileWriter("C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\cws\\OperacionesCorporativas"+sIDSOA+".xml");
	    		pw = new PrintWriter(fichero);
	    		URL restServiceURL = new URL(targetURL);
	    		HttpURLConnection httpConnection = (HttpURLConnection) restServiceURL.openConnection();
	    		httpConnection.setRequestMethod("GET");
	    		httpConnection.setRequestProperty("Accept", "application/json");
	    		if (httpConnection.getResponseCode() != 200) {
//	    			System.out.println("No pudo obtener del catalogo la informacion relacionada al IDSOA: " + sIDSOA);
	    			return false;
//	    			throw new RuntimeException("HTTP GET Request Failed with Error code : "+ httpConnection.getResponseCode());
	    		}
	    		BufferedReader responseBuffer = new BufferedReader(new InputStreamReader((httpConnection.getInputStream())));
	    		String output;
	    		while ((output = responseBuffer.readLine()) != null) {
//	              System.out.println(output);
	    			pw.println(output);
	    		}
	    		fichero.close();
	    		httpConnection.disconnect();
	        } 
	        catch (MalformedURLException e) {
	        	e.printStackTrace();
	        	return false;
	        } 
	        catch (IOException e) {
	        	e.printStackTrace();
	        	return false;
	        }
		    return true;
	  }

	  private static String sGetByIDSOA (String sPathOpCorp)
	  {
		  String sUriOriginal = "-1";
		  try {
		        File archivo = null;
		        FileReader fr = null;
		        BufferedReader br = null;
			    archivo = new File (sPathOpCorp);
			    fr = new FileReader (archivo);
			    br = new BufferedReader(fr);
		        // Lectura del fichero
		        String linea;
		        String nombrecambiado;
		        boolean bSectionUri = false;
		        while((linea=br.readLine())!=null) {
		        	if (linea.indexOf("d:Ficha_x0020_Completa m:type")!=-1) bSectionUri=true;
		        	if (bSectionUri) {
		        		if (linea.indexOf("d:Url")!=-1) {
		        			String sTmp =  "<d:Url>";
		        			int iBeginFicha = linea.indexOf("d:Ficha_x0020_Completa m:type");
		        			int iBeginURI = linea.indexOf("<d:Url>",iBeginFicha) + sTmp.length();
		        			int iEndURI = linea.indexOf("</d:Url>",iBeginFicha);
		        			sUriOriginal = (String) linea.subSequence(iBeginURI, iEndURI);
		        			sUriOriginal = sUriOriginal.replace("amp;", "");
//		        			System.out.println ("URL a la ficha de la operacion extraida: \n" + sUriOriginal);
		        		}
		        	}
		        }
	    	}
		    catch(Exception e){
		        e.printStackTrace();
		        System.out.println ("Problema con el archivo: " + sPathOpCorp);
		        System.exit(1);
		     }
			return sUriOriginal;
	  }
	  
	  private static Boolean bGetPage (String sUrlToGet, String sOperacionTecnica) 
	  {
	      String results;
	      try {
	    	  results = doHttpUrlConnectionAction(sUrlToGet);
			  try {
				  FileWriter fichero = null;
				  PrintWriter pw = null;
				  fichero = new FileWriter(sOperacionTecnica);
				  pw = new PrintWriter(fichero);
				  pw.println(results);
				  fichero.close();
			  } 
			  catch (MalformedURLException e) {
				  e.printStackTrace();
				  return false;
			  } 
			  catch (IOException e) {
				  e.printStackTrace();
				  return false;
			  }
	      }
	      catch (Exception e) {
	    	  // TODO Auto-generated catch block
	    	  e.printStackTrace();
	    	  return false;
	      }
	      return true;
	  }  
	  
	  public static String[] demo(String sOperacionTecnica) //for the sake of example, I made it static.
	  {
		  String[] ret = new String[3];
		    try {
		        File archivo = null;
		        FileReader fr = null;
		        BufferedReader br = null;
			    archivo = new File (sOperacionTecnica);
			    fr = new FileReader (archivo);
			    br = new BufferedReader(fr);
		        // Lectura del fichero
		        String linea;
		        String nombrecambiado;
		        boolean bSectionUri = false;
		        while((linea=br.readLine())!=null) {
		        	if (linea.indexOf("ListData")!=-1) bSectionUri=true;
		        	if (bSectionUri) {
		        		// consumidores
		        		if (linea.indexOf("Consumidores")!=-1) {
		        			String sTmp =  "Consumidores";
		        			int iBeginURI = linea.indexOf("Consumidores") + sTmp.length() + 3;
		        			//int iEndURI = linea.indexOf("rotocolo_x0020__x002f__x0020_Me", iBeginURI);
		        			int iEndURI = linea.indexOf(",", iBeginURI) + 1;
		        			ret[0] = (String) linea.subSequence(iBeginURI, iEndURI);
//		        			System.out.println ("consumidores: " + ret[0]);
		        		}
		        		if (linea.indexOf("Nombre_x0020_Funcional_x0020_Ser")!=-1) {
		        			String sTmp =  "Nombre_x0020_Funcional_x0020_Ser";
		        			int iBeginURI = linea.indexOf("Nombre_x0020_Funcional_x0020_Ser") + sTmp.length() + 3;
		        			int iEndURI = linea.indexOf(';', iBeginURI);
		        			ret[1] = (String) linea.subSequence(iBeginURI, iEndURI);
//		        			System.out.println ("URL a la ficha del fwk \n" + ret[1]);
		        		}
		        		// Obtiene el Due�o de la operacion
		        		if (linea.indexOf("Due_x00f1_o_x0020_de_x0020_la_x0")!=-1) {
		        			String sTmp =  "Due_x00f1_o_x0020_de_x0020_la_x0";
		        			int iBeginURI = linea.indexOf("Due_x00f1_o_x0020_de_x0020_la_x0") + sTmp.length() + 3;
		        			//int iEndURI = linea.indexOf("rotocolo_x0020__x002f__x0020_Me", iBeginURI);
		        			int iEndURI = linea.indexOf(",", iBeginURI) + 1;
		        			ret[2] = (String) linea.subSequence(iBeginURI, iEndURI);
//		        			System.out.println ("consumidores: " + ret[0]);
		        		}
		        	}
		        }
	    	}
	    catch(Exception e){
	        e.printStackTrace();
	        System.out.println ("Problema con el archivo: " + sOperacionTecnica);
	        System.exit(1);
	        
	     }
		  return ret;
	  }	 
	
	  public static String[] sAnalisisNombreFunciona(String sNombreFunciona) //for the sake of example, I made it static.
	  {
		  String[] ret = new String[3];
		    try {
		    	
		    	File archivo = null;
		        FileReader fr = null;
		        BufferedReader br = null;
			    archivo = new File (sNombreFunciona);
			    fr = new FileReader (archivo);
			    br = new BufferedReader(fr);
		
			      // Lectura del fichero
			      String linea;
			      String nombrecambiado;
			      boolean bSectionUri = false;
			      while((linea=br.readLine())!=null) {
			      	if (linea.indexOf("ListData")!=-1) bSectionUri=true;
			      	if (bSectionUri) {
			      		//extrae Framework
			      		if (linea.indexOf("Framework_x0020_Aplicativo")!=-1) {
			      			String sTmp =  "Framework_x0020_Aplicativo";
			      			int iBeginURI = linea.indexOf("Framework_x0020_Aplicativo") + sTmp.length();
			      			iBeginURI = linea.indexOf(';', iBeginURI);
			      			int iEndURI = linea.indexOf(',', iBeginURI);
			      			ret[0] = (String) linea.subSequence(iBeginURI + 2, iEndURI - 1);
//			      			System.out.println ("El framework es: " + ret[0]);
			      		} 

			      		//extrae Nombre Tecnico del Servicio
			      		if (linea.indexOf("Nombre_x0020_Tecnico_x0020_del_x")!=-1) {
			      			String sTmp =  "Nombre_x0020_Tecnico_x0020_del_x";
			      			int iBeginURI = linea.indexOf("Nombre_x0020_Tecnico_x0020_del_x") + sTmp.length() + 3;
			      			int iEndURI = linea.indexOf(',', iBeginURI);
			      			ret[1] = (String) linea.subSequence(iBeginURI, iEndURI - 1);
//			      			System.out.println ("Nombre Tecnico del Servicio: " + ret[1]);
			      		} 
			      			//extrae URL de prod
			         		if (linea.indexOf("URL_x0020_Producci_x00f3_n")!=-1) {
			         			String sTmp =  "URL_x0020_Producci_x00f3_n";
			         			int iBeginURI = linea.indexOf("URL_x0020_Producci_x00f3_n") + sTmp.length();
			         			iBeginURI = linea.indexOf(',', iBeginURI);
			         			int iEndURI = linea.indexOf('"', iBeginURI);
			         			ret[2] = (String) linea.subSequence(iBeginURI + 1, iEndURI);
//			         			System.out.println ("La URL de prod es:" + ret[2]);
			         		}
			      	}
			      }
				}
	    catch(Exception e){
	        e.printStackTrace();
	        System.out.println ("sAnalisisNombreFunciona - Problema con el archivo: " + sNombreFunciona);
	        ret[0] = "No pudo recuperar el Framework";
	        ret[1] = "No pudo recuperar el Nombre Tecnico";
	        ret[2] = "No pudo recuperar la URL";
	        return ret;
	     }
		  return ret;
	  }	 
  
	  private static String doHttpUrlConnectionAction(String desiredUrl)
			  throws Exception
			  {
			    URL url = null;
			    BufferedReader reader = null;
			    StringBuilder stringBuilder;

			    try
			    {
			      // create the HttpURLConnection
			      url = new URL(desiredUrl);
			      HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			      
			      // just want to do an HTTP GET here
			      connection.setRequestMethod("GET");
			      
			      // uncomment this if you want to write output to this url
			      //connection.setDoOutput(true);
			      
			      // give it 15 seconds to respond
			      connection.setReadTimeout(15*1000);
			      connection.connect();

			      // read the output from the server
			      reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			      stringBuilder = new StringBuilder();

			      String line = null;
			      while ((line = reader.readLine()) != null)
			      {
			        stringBuilder.append(line + "\n");
			      }
			      return stringBuilder.toString();
			    }
			    catch (Exception e)
			    {
			      e.printStackTrace();
			      throw e;
			    }
			    finally
			    {
			      // close the reader; this can throw an exception too, so
			      // wrap it in another try/catch block.
			      if (reader != null)
			      {
			        try
			        {
			          reader.close();
			        }
			        catch (IOException ioe)
			        {
			          ioe.printStackTrace();
			        }
			      }
			    }
			  }

}

