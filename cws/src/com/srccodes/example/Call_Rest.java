
package com.srccodes.example;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.io.*;



import javax.xml.namespace.QName;
import javax.xml.ws.Service;

import java.net.MalformedURLException;
import java.net.URL;

public class Call_Rest {

	/**
	 * @param args
	 * @throws MalformedURLException 
	 */
	public static void main(String[] args) throws MalformedURLException {
		// TODO Auto-generated method stub
		System.out.println("Hello World");
		
		
        URL url = new URL("http://localhost:9876/one?wsdl");

        // Qualified name of the service:
        //   1st arg is the service URI
        //   2nd is the service name published in the WSDL

        QName qname = new QName("http://example.srccodes.com/", "TimeServerImplService");

        // Create, in effect, a factory for the service.

        Service service = Service.create(url, qname);

        // Extract the endpoint interface, the service "port".

        TimeServer eif = service.getPort(TimeServer.class);

        System.out.println(eif.getTimeAsString());
        System.out.println(eif.getTimeAsElapsed());

        

        
        
        
        String targetURL = "http://ecc.bancogalicia.com.ar/sites/ac/soa/_api/web/lists/getbytitle('Operaciones%20Corporativas')/items(1711)";
        System.out.println (targetURL);
        try {
            FileWriter fichero = null;
            PrintWriter pw = null;
            fichero = new FileWriter("C:\\Users\\l0646482\\n\\mi_desa\\Eclipse\\cws\\OperacionesCorporativas1711.xml");
            pw = new PrintWriter(fichero);

        	
        	
          URL restServiceURL = new URL(targetURL);
          System.out.println ("Debug 1");
          HttpURLConnection httpConnection = (HttpURLConnection) restServiceURL.openConnection();
          System.out.println ("Debug 2");
          httpConnection.setRequestMethod("GET");
          System.out.println ("Debug 3");
          httpConnection.setRequestProperty("Accept", "application/json");
          System.out.println ("Debug 4");
          if (httpConnection.getResponseCode() != 200) {
              System.out.println ("Debug 5: " + httpConnection.getResponseCode());
              throw new RuntimeException("HTTP GET Request Failed with Error code : "
                      + httpConnection.getResponseCode());
          }
          System.out.println ("Debug 6");
          BufferedReader responseBuffer = new BufferedReader(new InputStreamReader(
              (httpConnection.getInputStream())));
          String output;
          System.out.println("Output from Server:  \n");
          while ((output = responseBuffer.readLine()) != null) {
//              System.out.println(output);
              pw.println(output);
          }
          fichero.close();
          System.out.println ("Debug 7");
          httpConnection.disconnect();
        } catch (MalformedURLException e) {
          e.printStackTrace();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }

}
